#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "code_generator.h"

long globalVarCount = 0;

char *getFirstRegister()
{
    return "rax";
}

char *getThisRegister()
{
    return "rdi";
}

char *getNextRegister(char *lastRegister)
{

    if (lastRegister == NULL)
    {
        return "rax";
    }

    char *registers[] = {"rax", "r11", "r10", "r9", "r8", "rcx", "rdx", "rsi", "rdi"};

    for (int i = 0; i < 8; i++)
    {
        if (strcmp(registers[i], lastRegister) == 0)
        {
            return registers[i + 1];
        }
    }

    fprintf(stderr, "No more registers available or previous register not found: '%s'\n", lastRegister);
    exit(3);
}

char *getParameterRegister(int index)
{
    char *registers[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};

    if (index >= 0 && index <= 5)
    {
        return registers[index];
    }

    fprintf(stderr, "Invalid register index specified for getParameterRegister: %i\n", index);
    exit(3);
}

char *getByteRegisterName(char *name)
{

    if (name == NULL)
    {
        return "al";
    }

    char *registers[] = {"rax", "r11", "r10", "r9", "r8", "rcx", "rdx", "rsi", "rdi"};
    char *byteRegisters[] = {"al", "r11b", "r10b", "r9b", "r8b", "cl", "dl", "sil", "dil"};

    for (int i = 0; i < 8; i++)
    {
        if (strcmp(registers[i], name) == 0)
        {
            return byteRegisters[i];
        }
    }

    fprintf(stderr, "Byte register not found for: '%s'", name);
    exit(3);
}

void writeEnterFunction(char *name)
{
    //TODO: check if this allowed or would this make the function public?
    fprintf(stdout, "\t.global\t%s\n", name);
    fprintf(stdout, "\t.type\t%s, @function\n", name);
    fprintf(stdout, "%s:\n", name);
}

void writeAdd(char *src, char *dst)
{
    fprintf(stdout, "\taddq\t%%%s, %%%s\n", src, dst);
}

void writeAddv(long value, char *dst)
{
    fprintf(stdout, "\taddq\t$%ld, %%%s\n", value, dst);
}

void writeSub(char *src, char *dst)
{
    fprintf(stdout, "\tsubq\t%%%s, %%%s\n", src, dst);
}

void writeSubv(long value, char *dst)
{
    fprintf(stdout, "\tsubq\t$%ld, %%%s\n", value, dst);
}

void writeMul(char *src, char *dst)
{
    fprintf(stdout, "\timulq\t%%%s, %%%s\n", src, dst);
}

void writeMulv(long value, char *dst)
{
    fprintf(stdout, "\timulq\t$%ld, %%%s\n", value, dst);
}

void writeMove(char *src, char *dst)
{
    fprintf(stdout, "\tmovq\t%%%s, %%%s\n", src, dst);
}

void writeMovev(long value, char *dst)
{
    fprintf(stdout, "\tmovq\t$%ld, %%%s\n", value, dst);
}

void writeAnd(char *src, char *dst)
{
    fprintf(stdout, "\tand\t%%%s, %%%s\n", src, dst);
}
void writeAndv(long value, char *dst)
{
    fprintf(stdout, "\tand\t$%ld, %%%s\n", value, dst);
}

void writeNeg(char *name)
{
    fprintf(stdout, "\tnegq\t%%%s\n", name);
}

void writeNot(char *name)
{
    fprintf(stdout, "\tnotq\t%%%s\n", name);
}

void writeAddressRead(char *src, char *dst)
{
    fprintf(stdout, "\tmovq\t(%%%s), %%%s\n", src, dst);
}

void writeAddressReadv(long value, char *dst)
{
    fprintf(stdout, "\tmovq\t($%ld), %%%s\n", value, dst);
}

void writeNotEqual(char *first, char *second, char *dst)
{
    fprintf(stdout, "\tcmp\t%%%s, %%%s\n", first, second);
    fprintf(stdout, "\tsetne\t%%%s\n", getByteRegisterName(dst));
    fprintf(stdout, "\tand\t$1, %%%s\n", dst);
    writeNeg(dst);
}

void writeNotEqualv(long value, char *second, char *dst)
{
    fprintf(stdout, "\tcmp\t\t$%ld, %%%s\n", value, second);
    fprintf(stdout, "\tsetne\t%%%s\n", getByteRegisterName(dst));
    fprintf(stdout, "\tand\t\t$1, %%%s\n", dst);
    writeNeg(dst);
}

void writeLessEqual(char *first, char *second, char *dst)
{
    fprintf(stdout, "\tcmp\t\t%%%s, %%%s\n", first, second);
    fprintf(stdout, "\tsetle\t%%%s\n", getByteRegisterName(dst));
    fprintf(stdout, "\tand\t\t$1, %%%s\n", dst);
    writeNeg(dst);
}

void writeLessEqualFv(long value, char *second, char *dst)
{
    fprintf(stdout, "\tcmp\t\t$%ld, %%%s\n", value, second);
    fprintf(stdout, "\tsetle\t%%%s\n", getByteRegisterName(dst));
    fprintf(stdout, "\tand\t\t$1, %%%s\n", dst);
    writeNeg(dst);
}

void writeLessEqualSv(char *first, long value, char *dst)
{
    fprintf(stdout, "\tcmp\t\t$%ld, %%%s\n", value, first);
    fprintf(stdout, "\tsetnle\t%%%s\n", getByteRegisterName(dst));
    fprintf(stdout, "\tand\t\t$1, %%%s\n", dst);
    writeNeg(dst);
}

void writeReturn()
{
    if (globalVarCount > 0)
    {
        fprintf(stdout, "\tleave\n");
    }
    fprintf(stdout, "\tret\n");
}

void writeReturnWithValue(char *retRegister)
{
    if (retRegister != NULL && strcmp(retRegister, "rax") != 0)
    {
        writeMove(retRegister, "rax");
    }

    writeReturn();
}

void generateClassTable(node_t *node, meth_node_t *implmethds)
{
    // printf("Implemented lsit \n");
    // printItemsImpl(implmethds);

    // printf("Normal nodes\n");
    //printItems(node);

    //printf("\n\n");
    // reading all the abstrakt meths
    //printf("Abstrakts methds: \n");

    node_t *abstractMethds = newList();
    abstractMethds = getAllOfType(abstractMethds, node, ABSTRACT_METH);

    //printf("\n\n");
    // reading all the classes
    //printf("Classes: \n");

    node_t *allClasses = newList();
    allClasses = getAllOfType(allClasses, node, CLASS_DING);

    // iterate over all the classes
    node_t *nextNode = allClasses;
    while (nextNode != NULL)
    {
        generateClassTableForASingleClass(nextNode->name, abstractMethds, implmethds);

        nextNode = nextNode->next;
    }
}

void generateClassTableForASingleClass(char *className, node_t *abstractMethds, meth_node_t *implmethds)
{
    printf("\n"); // just to have a bit more spacing
    printf(".globl %s\n", className);
    printf("%s:   \n", className);

    node_t *nextNode = abstractMethds;
    while (nextNode != NULL)
    {
        if (isMethImplemtedByClass(implmethds, className, nextNode->name) == 0)
        {
            // the method is not implemented in this class so we need to print a other quad
            printf(".quad 0 #%s\n", nextNode->name);
        }
        else
        {
            // this method is implementd yeah 8D
            printf(".quad %s_%s\n", className, nextNode->name);
        }

        nextNode = nextNode->next;
    }

    printf("\n\n");
}

void generateMethodeLabel(char *className, char *meth_name, long varCounter)
{
    printf("%s_%s:\n", className, meth_name);

    if (varCounter > 0)
    {
        //TODO: not working as expected
        globalVarCount = varCounter;
        fprintf(stdout, "\tenter\t$%li, $0\n", varCounter * 8);
    }
    else
    {
        globalVarCount = 0;
    }
}

void writeMoveForClassVar(int classVaroffset, char *dst)
{
    // offset starts at 0
    int calculatedPosition = 8 + (8 * classVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t%d(%%%s), %%%s\n", calculatedPosition, getThisRegister(), dst);
}

void writeMoveVIntoClassVar(long value, int classVaroffset)
{
    // offset starts at 0
    int calculatedPosition = 8 + (8 * classVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t$%ld, %d(%%%s)\n", value, calculatedPosition, getThisRegister());
}

void writeMoveRegIntoClassVar(char *src, int classVaroffset)
{
    // offset starts at 0
    int calculatedPosition = 8 + (8 * classVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t%%%s, %d(%%%s)\n", src, calculatedPosition, getThisRegister());
}

void writeMoveStackIntoClassVar(long srcOffset, int classVaroffset)
{
    //NOTE: the stack offset you provide will be mulitplied by 8 so take care of that!!!

    // offset starts at 0
    int calculatedPosition = 8 + (8 * classVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t%ld(%%rsp), %d(%%%s)\n", srcOffset * 8, calculatedPosition, getThisRegister());
}

void writeMoveClassVarIntoClassVar(int srcClassVaroffset, int dstClassVaroffset)
{
    //NOTE: the stack offset you provide will be mulitplied by 8 so take care of that!!!

    // offset starts at 0
    int dstCalculatedPosition = 8 + (8 * dstClassVaroffset);
    int srcCalculatedPosition = 8 + (8 * srcClassVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t%d(%%%s), %d(%%%s)\n", srcCalculatedPosition, getThisRegister(), dstCalculatedPosition, getThisRegister());
}

void writeThisMovq(char *dst)
{
    fprintf(stdout, "\tmovq\t%%%s, %%%s\n", getThisRegister(), dst);
}

void writeNeq(char *srcDst)
{
    fprintf(stdout, "\tnegq\t%%%s\n", srcDst);
}

void writeEqualsv(long value, char *reg, char *dst)
{
    fprintf(stdout, "\tcmpq\t$%ld, %%%s\t# checking if %ld equals %s\n", value, reg, value, reg);
    fprintf(stdout, "\tsete\t%%%s\n", getByteRegisterName(dst));
    writeAndv(1, dst);
    writeMulv(-1, dst);
}

void writeEquals(char *reg1, char *reg2, char *dst)
{
    fprintf(stdout, "\tcmpq\t%%%s, %%%s\t# checking if %s equals %s\n", reg1, reg2, reg1, reg2);
    fprintf(stdout, "\tsete\t%%%s\n", getByteRegisterName(dst));
    writeAndv(1, dst);
    writeMulv(-1, dst);
}

void writeVLessReg(long value, char *reg, char *dst)
{
    fprintf(stdout, "\tcmpq\t$%ld, %%%s\t# checking if %ld less %s\n", value, reg, value, reg);

    fprintf(stdout, "\tsetg\t%%%s\n", getByteRegisterName(dst));
    writeAndv(1, dst);
    writeMulv(-1, dst);
}

void writeRegLessV(char *reg, long value, char *dst)
{
    fprintf(stdout, "\tcmpq\t$%ld, %%%s\t# checking if %ld less %s (inverted because right const not allwoed) \n", value, reg, value, reg);
    fprintf(stdout, "\tsetl\t%%%s\n", getByteRegisterName(dst));
    writeAndv(1, dst);
    writeMulv(-1, dst);
}

void writeRegLessReg(char *reg1, char *reg2, char *dst)
{
    fprintf(stdout, "\tcmpq\t%%%s, %%%s\t# checking if %s less %s\n", reg1, reg2, reg1, reg2);
    fprintf(stdout, "\tsetg\t%%%s\n", getByteRegisterName(dst));
    writeAndv(1, dst);
    writeMulv(-1, dst);
}

void writeMoveStack(long offset, char *dst)
{
    //NOTE: the offset you provide will be mulitplied by 8 so take care of that!!!
    fprintf(stdout, "\tmovq\t%ld(%%rsp), %%%s\n", offset * 8, dst);
}

void writeMoveRegInStack(char *src, long offset)
{
    //NOTE: the offset you provide will be mulitplied by 8 so take care of that!!!
    printf("\tmovq\t%%%s, %ld(%%rsp)\n", src, offset * 8);
}

void writeMoveVInStack(long value, long offset)
{
    //NOTE: the offset you provide will be mulitplied by 8 so take care of that!!!
    printf("\tmovq\t$%ld, %ld(%%rsp)\n", value, offset * 8);
}

void writeMoveStackInStack(long srcOffset, long dstOffset)
{
    //NOTE: the offset you provide will be mulitplied by 8 so take care of that!!!
    printf("\tmovq\t%ld(%%rsp), %ld(%%rsp)\n", srcOffset * 8, dstOffset * 8);
}

void writeMoveClassVarInStack(int classVaroffset, long dstOffset)
{
    // offset starts at 0
    int calculatedPosition = 8 + (8 * classVaroffset);

    // movq calculatedPosition(getThisRegister()), dst
    fprintf(stdout, "\tmovq\t%d(%%%s), %ld(%%rsp)\n", calculatedPosition, getThisRegister(), dstOffset * 8);
}

void writeElseLabel(char *name)
{
    fprintf(stdout, "\n\t%s_else:\n", name);
}

void writeIfEndLabel(char *name)
{
    fprintf(stdout, "\n\t%s_end:\n", name);
}

void writeJumpToIfEnd(char *name)
{
    fprintf(stdout, "\tjmp\t%s_end\n", name);
}

void writeJumpEvenIf(char *src, char *jumpName)
{
    fprintf(stdout, "\tcmpq\t$0, %%%s\n", src);
    fprintf(stdout, "\tjns\t%s_end\n", jumpName);
}

void writeJumpEvenIfElse(char *src, char *jumpName)
{
    fprintf(stdout, "\tcmpq\t$0, %%%s\n", src);
    fprintf(stdout, "\tjns\t%s_else\n", jumpName);
}

void writeJumpEnd(char *jumpName)
{
    fprintf(stdout, "\tjmp\t%s_end\n", jumpName);
}

void processInjection(code_injection_t *injection)
{
    if (injection == NULL)
    {
        //AKA do nothing since we dont have an injection
        return;
    }

    if (injection->op == OP_END_JUMP)
    {
        writeJumpEnd(injection->injectionLabel);
    }
    else if (injection->op == OP_ELSE_LABEL)
    {
        writeElseLabel(injection->injectionLabel);
    }
    else if (injection->op == OP_LOOP_LABEL)
    {
        writeLoopEntry(injection->injectionLabel);
    }
}

void writeLoopJumpToStart(char *label)
{
    fprintf(stdout, "\tjmp\t%s\n", label);
}

void writeLoopEntry(char *label)
{
    fprintf(stdout, "\n\t%s:\n", label);
}

void writeLoopCheck(char *label, char *src)
{
    fprintf(stdout, "\tcmpq\t$0, %%%s\n", src);
    fprintf(stdout, "\tjns\t%s_end\n", label);
}

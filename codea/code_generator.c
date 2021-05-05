#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *registers[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9", "r11"};
char *returnRegister = "rax";

char *getFirstRegister()
{
    return registers[0];
}

char *getNextRegister(char *lastRegister)
{

    if (lastRegister == NULL)
    {
        return getFirstRegister();
    }

    for (int i = 0; i < 7; i++)
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

#include "list.h"
#include "implemented_meth_list.h"
#include "code_injection.h"
#include "class_var_list.h"

#define TRUE_VAL -1
#define FALSE_VAL 0

char *getFirstRegister();
char *getNextRegister(char *);
char *getParameterRegister(int);
char *getByteRegisterName(char *);

void writeEnterFunction(char *);

void writeAdd(char *, char *);
void writeAddv(long, char *);

void writeSub(char *, char *);
void writeSubv(long, char *);

void writeMul(char *, char *);
void writeMulv(long, char *);

void writeMove(char *, char *);
void writeMovev(long, char *);

void writeAnd(char *, char *);
void writeAndv(long, char *);

void writeNeg(char *);
void writeNot(char *);

void writeAddressRead(char *, char *);
void writeAddressReadv(long, char *);

void writeNotEqual(char *, char *, char *);
void writeNotEqualv(long, char *, char *);

void writeLessEqual(char *, char *, char *);
void writeLessEqualFv(long, char *, char *);
void writeLessEqualSv(char *, long, char *);

void writeReturn();
void writeReturnWithValue(char *);

void generateClassTable(node_t *node, meth_node_t *implmethds, classvar_node_t *classVars);
void generateClassTableForASingleClass(char *className, node_t *abstractMethds, meth_node_t *implmethds, long classSize);

void generateMethodeLabel(char *classname, char *meth_name, long varCounter);

void writeMoveForClassVar(int classVaroffset, char *dst);
void writeMoveVIntoClassVar(long value, int classVaroffset);
void writeMoveRegIntoClassVar(char *src, int classVaroffset);
void writeMoveStackIntoClassVar(long srcOffset, int classVaroffset);
void writeMoveClassVarIntoClassVar(int srcClassVaroffset, int dstClassVaroffset);

char *getThisRegister();

void writeThisMovq(char *dst);

void writeNeq(char *srcDst);

void writeEqualsv(long value, char *reg, char *dst);
void writeEquals(char *reg1, char *reg2, char *dst);

void writeVLessReg(long value, char *reg, char *dst);
void writeRegLessV(char *reg, long value, char *dst);
void writeRegLessReg(char *reg1, char *reg2, char *dst);

void writeMoveStack(long offset, char *dst);
void writeMoveVInStack(long value, long offset);
void writeMoveRegInStack(char *src, long offset);
void writeMoveStackInStack(long srcOffset, long dstOffset);
void writeMoveClassVarInStack(int classVaroffset, long dstOffset);

void writeElseLabel(char *name);
void writeIfEndLabel(char *name);
void writeJumpToIfEnd(char *name);
void writeJumpEvenIf(char *src, char *jumpName);
void writeJumpEvenIfElse(char *src, char *jumpName);

void writeJumpEnd(char *jumpName);
void writeLoopEntry(char *label);
void writeLoopJumpToStart(char *label);
void writeLoopCheck(char *label, char *src);

void processInjection(code_injection_t *injection);

void generateNewObjekt(char *className, char *dst);
char *getHeapPointer();
char *generateClassSizeLabel(char *className);

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

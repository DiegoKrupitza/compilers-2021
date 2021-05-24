#ifndef CODE_INJECTION_H
#define CODE_INJECTION_H

typedef enum
{
    OP_END_JUMP,
    OP_ELSE_LABEL,
    OP_LOOP_LABEL
} code_injection_operators_t;

typedef struct code_injection_t
{
    int op;
    char *injectionLabel;
} code_injection_t;

code_injection_t *createElseJMP_injection(char *injectionLabel);
code_injection_t *createEndJMP_injection(char *injectionLabel);
code_injection_t *createLoopLabel_injection(char *injectionLabel);

#endif

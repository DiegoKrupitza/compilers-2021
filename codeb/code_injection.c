#include "code_injection.h"
#include <stdlib.h>

code_injection_t *createElseJMP_injection(char *injectionLabel)
{
    code_injection_t *node = (code_injection_t *)malloc(sizeof(code_injection_t));

    node->op = OP_ELSE_LABEL;
    node->injectionLabel = injectionLabel;
    return node;
}

code_injection_t *createEndJMP_injection(char *injectionLabel)
{
    code_injection_t *node = (code_injection_t *)malloc(sizeof(code_injection_t));

    node->op = OP_END_JUMP;
    node->injectionLabel = injectionLabel;
    return node;
}

code_injection_t *createLoopLabel_injection(char *injectionLabel) {
    code_injection_t *node = (code_injection_t *)malloc(sizeof(code_injection_t));

    node->op = OP_LOOP_LABEL;
    node->injectionLabel = injectionLabel;
    return node;
}

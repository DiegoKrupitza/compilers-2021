#ifndef DATASTRUCTS_H_CLASS_VAR_LIST
#define DATASTRUCTS_H_CLASS_VAR_LIST

#include <stdbool.h>

typedef struct classvar_node_t
{
    char *className;
    char *varname;
    struct classvar_node_t *next;
} classvar_node_t;

classvar_node_t *newClarrVarList();

classvar_node_t *addClassVar(classvar_node_t *, char *className, char *varname);

void printItemsClassVar(classvar_node_t *list);

long countOfClassVarsForClass(classvar_node_t *list, char *className);

#endif

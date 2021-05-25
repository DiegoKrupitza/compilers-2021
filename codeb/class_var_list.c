#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "class_var_list.h"

classvar_node_t *newClarrVarList()
{
    return (classvar_node_t *)NULL;
}

classvar_node_t *addClassVar(classvar_node_t *list, char *className, char *varname)
{

    if (list == NULL)
    {
        list = (classvar_node_t *)malloc(sizeof(classvar_node_t));
        list->className = className;
        list->varname = varname;
        list->next = NULL;

        return list;
    }

    classvar_node_t *newNode = (classvar_node_t *)malloc(sizeof(classvar_node_t));
    newNode->className = className;
    newNode->varname = varname;
    newNode->next = NULL;

    if (list->next == NULL)
    {
        list->next = newNode;

        return list;
    }

    classvar_node_t *nextNode = list->next;

    while (true)
    {
        if (nextNode->next != NULL)
        {
            nextNode = nextNode->next;
        }
        else
        {
            break;
        }
    }

    nextNode->next = newNode;

    return list;
}

void printItemsClassVar(classvar_node_t *list)
{
    classvar_node_t *nextNode = list;

    int counter = 0;

    while (nextNode != NULL)
    {
        counter++;

        fprintf(stdout, "Item %i, Classname: %s, Varname: %s\n",
                counter, nextNode->className, nextNode->varname);
        nextNode = nextNode->next;
    }
}

long countOfClassVarsForClass(classvar_node_t *list, char *className)
{
    //TODO IMPL
    long counter = 0;

    classvar_node_t *nextNode = list;

    while (nextNode != NULL)
    {
        if (strcmp(nextNode->className, className) == 0)
        {
            counter++;
        }

        nextNode = nextNode->next;
    }
    return counter;
}

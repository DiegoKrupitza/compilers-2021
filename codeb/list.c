#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "list.h"

void checkForError(node_t *node, char *name, short type, int lineNr)
{

    if (strcmp(node->name, name) == 0)
    {
        fprintf(stderr, "Identifier '%s' on line %d conflicts with identifier [%s] on line %d\n",
                name, lineNr, node->name, node->lineNr);
        exit(3);
    }

    return;
}

node_t *newList()
{
    return (node_t *)NULL;
}

/** achtung hier wird das element zu der list hinzugefügt in memory und dann returned */
node_t *add(node_t *list, char *name, short type, int lineNr)
{

    if (list == NULL)
    {
        list = (node_t *)malloc(sizeof(node_t));
        list->name = name;
        list->type = type;
        list->lineNr = lineNr;
        list->next = NULL;

        return list;
    }

    // check if the name is already used in the scope
    checkForError(list, name, type, lineNr);

    node_t *newNode = (node_t *)malloc(sizeof(node_t));
    newNode->name = name;
    newNode->type = type;
    newNode->lineNr = lineNr;
    newNode->next = NULL;

    if (list->next == NULL)
    {
        list->next = newNode;

        return list;
    }

    node_t *nextNode = list->next;

    while (true)
    {
        // check if the name is already used in the scope
        checkForError(nextNode, name, type, lineNr);

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

node_t *addDev(node_t *list, char *name, short type, int lineNr, char *source)
{
    if (DEBUG == 1)
    {
        fprintf(stderr, "Added '%s' with type %i from '%s'\n", name, type, source);

        node_t *items = add(list, name, type, lineNr);

        printItems(items);

        fprintf(stdout, "-----------------\n");

        return items;
    }

    return add(list, name, type, lineNr);
}

node_t *merge(node_t *firstList, node_t *secondList)
{
    node_t *newListItem = duplicate(firstList);

    node_t *nextNode = secondList;

    while (nextNode != NULL)
    {
        newListItem = add(newListItem, nextNode->name, nextNode->type, nextNode->lineNr);
        nextNode = nextNode->next;
    }

    return newListItem;
}

node_t *mergeDev(node_t *firstList, node_t *secondList, char *source)
{
    if (DEBUG == 1)
    {
        fprintf(stdout, "Merging two lists from '%s'\n", source);

        fprintf(stdout, "Contnet of List 1 before merge\n");
        printItems(firstList);
        fprintf(stdout, "-----------------\n");

        fprintf(stdout, "Contnet of List 2 before merge\n");
        printItems(secondList);
        fprintf(stdout, "-----------------\n");

        node_t *items = merge(firstList, secondList);

        printItems(items);

        fprintf(stdout, "-----------------\n");

        return items;
    }

    return merge(firstList, secondList);
}

node_t *mergeThree(node_t *firstList, node_t *secondList, node_t *thirdList)
{
    node_t *firstTwo = merge(firstList, secondList);

    node_t *newListItem = merge(firstTwo, thirdList);

    return newListItem;
}

node_t *mergeThreeDev(node_t *firstList, node_t *secondList, node_t *thirdList, char *source)
{
    if (DEBUG == 1)
    {
        fprintf(stdout, "Merging three lists from '%s'\n", source);

        node_t *items = mergeThree(firstList, secondList, thirdList);

        printItems(items);

        fprintf(stdout, "-----------------\n");

        return items;
    }

    return mergeThree(firstList, secondList, thirdList);
}

node_t *duplicate(node_t *list)
{
    node_t *newListItem = newList();

    node_t *nextNode = list;

    while (nextNode != NULL)
    {
        newListItem = add(newListItem, nextNode->name, nextNode->type, nextNode->lineNr);
        nextNode = nextNode->next;
    }

    return newListItem;
}

bool isEmpty(node_t *list)
{
    return list == NULL;
}

void isVisible(node_t *list, char *name, short type, int lineNr)
{

    node_t *nextNode = list;

    while (nextNode != NULL)
    {
        if (nextNode->type == type && strcmp(nextNode->name, name) == 0)
        {
            return;
        }

        nextNode = nextNode->next;
    }

    fprintf(stderr, "Identifier with name '%s' on line %d is not visible in the current scope\n",
            name, lineNr);
    exit(3);
}

void isVisibleForZuweisungOrZugriff(node_t *list, char *name, int lineNr)
{
    node_t *nextNode = list;

    while (nextNode != NULL)
    {
        if (
            (
                nextNode->type == CLASS_VAR ||
                nextNode->type == PARAMETER ||
                nextNode->type == VARIABLE) &&
            strcmp(nextNode->name, name) == 0)
        {
            return;
        }

        nextNode = nextNode->next;
    }

    fprintf(stderr, "Identifier with name '%s' on line %d is not visible(ObjectVar,Var,Param) in the current scope\n",
            name, lineNr);
    exit(3);
}

void printItems(node_t *list)
{
    node_t *nextNode = list;

    int counter = 0;

    while (nextNode != NULL)
    {
        counter++;

        fprintf(stdout, "Item %i, Type: %i, Name: %s\n",
                counter, nextNode->type, nextNode->name);
        nextNode = nextNode->next;
    }
}

int getParameterIndex(node_t *list, char *name)
{
    node_t *nextNode = list;

    // needs to start at 1 since "this" is on index 0
    int index = 1;
    while (nextNode != NULL)
    {
        if (nextNode->type == PARAMETER)
        {
            if (strcmp(nextNode->name, name) == 0)
            {
                return index;
            }
            index++;
        }
        nextNode = nextNode->next;
    }
    return -1;
}

int getClassVarOffset(node_t *list, char *name)
{
    node_t *nextNode = list;

    int index = 0;
    while (nextNode != NULL)
    {
        if (nextNode->type == CLASS_VAR)
        {
            if (strcmp(nextNode->name, name) == 0)
            {
                return index;
            }
            index++;
        }
        nextNode = nextNode->next;
    }
    return -1;
}

int getTypeOfName(node_t *list, char *name)
{
    node_t *nextNode = list;

    while (nextNode != NULL)
    {
        if (strcmp(nextNode->name, name) == 0)
        {
            return nextNode->type;
        }

        nextNode = nextNode->next;
    }

    // this should actually never happen....
    // bad diego bad diego ....
    return -1;
}

node_t *getAllOfType(node_t *returnList, node_t *list, int type)
{
    node_t *nextNode = list;

    while (nextNode != NULL)
    {
        if (nextNode->type == type)
        {
            // add to our list
            returnList = add(returnList, nextNode->name, nextNode->type, nextNode->lineNr);
        }

        nextNode = nextNode->next;
    }
    return returnList;
}

int calcCurrentLocalVarOffset(node_t *list)
{
    node_t *nextNode = list;

    int index = 0;
    while (nextNode != NULL)
    {
        if (nextNode->type == VARIABLE)
        {
            index++;
        }
        nextNode = nextNode->next;
    }
    return index;
}

int getLocalVarOffset(node_t *list, char *name)
{
    node_t *nextNode = list;

    int index = 0;
    while (nextNode != NULL)
    {
        if (nextNode->type == VARIABLE)
        {
            if (strcmp(nextNode->name, name) == 0)
            {
                return index;
            }
            index++;
        }
        nextNode = nextNode->next;
    }
    return -1;
}

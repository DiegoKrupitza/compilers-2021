#include <stdlib.h>
#include <stdio.h>

#include "tree.h"

/**
 * Creates a new tree node with left and right child 
 * on the top of the tree is a operation for examepl:
 * 
 *  createNode(OP_ADD,createNumericalLeaf(4),createNumericalLeaf(7));
 *       +
 *     /   \
 *    4     7
 * 
 *  createNode(OP_ADD,createIdentifierLeaf(result,2),createNumericalLeaf(7));
 *       -
 *     /   \
 *  result  7
 * 
 * 
 *  
 **/
tree_t *createNode(operators_t op, tree_t *left, tree_t *right)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = op;
    node->kids[0] = left;
    node->kids[1] = right;
    node->identifierName = (char *)NULL;

    return node;
}

tree_t *createComplexIdentifierLeaf(char *name, int type, int parameterIndex, int offset)
{
    if (type == VARIABLE)
    {
        //TODO: later when its wanted
        return NULL;
    }
    else if (type == PARAMETER)
    {
        // we have a param. menas we can have a valid paramIndex
        return createParamIdentifierLeaf(name, parameterIndex);
    }
    else if (type == CLASS_VAR)
    {
        // wee habe a class var. means we need have a valid offset
        return createClassVarIdentifierLead(name, offset);
    }

    return NULL;
}

tree_t *createClassVarIdentifierLead(char *name, int offset)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_CLASS_VAR_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;
    node->classVaroffset = offset;

    return node;
}

tree_t *createParamIdentifierLeaf(char *name, int parameterIndex)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_PARAM_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;
    node->parameterIndex = parameterIndex;

    return node;
}

tree_t *createThisLeaf()
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_THIS;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;

    return node;
}

tree_t *createNumericalLeaf(long value)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_NUMBER;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->value = value;

    return node;
}

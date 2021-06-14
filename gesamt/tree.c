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

tree_t *createParamNode(operators_t op, tree_t *left, tree_t *right, char *funcParamRegisterLeft, char *funcParamRegisterRight)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = op;
    node->kids[0] = left;
    node->kids[1] = right;
    node->identifierName = (char *)NULL;
    node->funcParamRegisterLeft = funcParamRegisterLeft;
    node->funcParamRegisterRight = funcParamRegisterRight;

    return node;
}

tree_t *createComplexFuncNode(operators_t op, tree_t *left, tree_t *right, int funcParamsCount)
{

    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = op;
    node->kids[0] = left;
    node->kids[1] = right;
    node->identifierName = (char *)NULL;
    node->funcParamsCount = funcParamsCount;

    return node;
}

tree_t *createEmptyLeaf()
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_EMPTY;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;

    return node;
}

tree_t *createNewObjectLeaf(char *className)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_NEW_OBJ;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = className;

    return node;
}

tree_t *createIfLabelLeaf(char *name)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_IF_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;

    return node;
}

tree_t *createLoopLabelLeaf(char *name)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_LOOP_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;

    return node;
}

tree_t *createComplexIdentifierLeaf(char *name, int type, int parameterIndex, int offset)
{
    if (type == VARIABLE)
    {
        // we have a simple variable this mean we have only the offset
        return createLocalVarIdentifierLeaf(name, offset);
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
    else if (type == ABSTRACT_METH)
    {
        return createMethodCallIdLeaf(name);
    }

    return NULL;
}

tree_t *createMethodCallIdLeaf(char *name)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_METH_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;

    return node;
}

tree_t *createLocalVarIdentifierLeaf(char *name, int offset)
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_ID;
    node->kids[0] = (tree_t *)NULL;
    node->kids[1] = (tree_t *)NULL;
    node->identifierName = name;
    node->localVarOffset = offset;

    return node;
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
    node->classVaroffset = -1;

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

tree_t *createNULLLeaf()
{
    tree_t *node = (tree_t *)malloc(sizeof(tree_t));

    node->op = OP_NULL;
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

#define COUNT 10

// Function to print binary tree in 2D
// It does reverse inorder traversal
void print2DUtil(tree_t *root, int space)
{
    // Base case
    if (root == NULL)
        return;

    // Increase distance between levels
    space += COUNT;

    // Process right child first
    print2DUtil(root->kids[1], space);

    // Print current node after space
    // count
    printf("\n");
    for (int i = COUNT; i < space; i++)
        printf(" ");
    printElem(root);

    // Process left child
    print2DUtil(root->kids[0], space);
}

void printElem(tree_t *root)
{
    if (root->op == OP_RETURN)
    {
        printf("RET\n");
    }
    else if (root->op == OP_ADD)
    {
        printf("+\n");
    }
    else if (root->op == OP_MUL)
    {
        printf("*\n");
    }
    else if (root->op == OP_AND)
    {
        printf("AND\n");
    }
    else if (root->op == OP_LESS)
    {
        printf("<\n");
    }
    else if (root->op == OP_EQUAL)
    {
        printf("=\n");
    }
    else if (root->op == OP_NOT)
    {
        printf("NOT\n");
    }
    else if (root->op == OP_MINUS)
    {
        printf("-\n");
    }
    else if (root->op == OP_NUMBER)
    {
        printf("%ld \n", root->value);
    }
    else if (root->op == OP_ID)
    {
        printf("ID: %s (Offset: %d) \n", root->identifierName, root->localVarOffset);
    }
    else if (root->op == OP_PARAM_ID)
    {
        printf("PARAM: %s\n", root->identifierName);
    }
    else if (root->op == OP_CLASS_VAR_ID)
    {
        printf("CVAR: %s\n", root->identifierName);
    }
    else if (root->op == OP_THIS)
    {
        printf("THIS\n");
    }
    else if (root->op == OP_NULL)
    {
        printf("NULLOP\n");
    }
    else if (root->op == OP_ASSIGN)
    {
        printf(":=\n");
    }
    else
    {
        printf("?\n");
    }
}

// Wrapper over print2DUtil()
void print2D(struct tree_t *root)
{
    printf("=======================================\n");
    // Pass initial space count as 0
    print2DUtil(root, 0);
    printf("=======================================\n");
}

#define DEBUGPRINT 0

tree_t *createNodeDEV(operators_t op, tree_t *left, tree_t *right)
{
    if (DEBUGPRINT == 1)
    {
        print2D(left);
    }
    return createNode(op, left, right);
}

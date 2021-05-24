#ifndef CODE
typedef struct burm_state *STATEPTR_TYPE;
#endif

typedef enum
{
    OP_RETURN = 0,
    OP_ADD,
    OP_MUL,
    OP_AND,
    OP_LESS,
    OP_EQUAL,
    OP_NOT,
    OP_MINUS,
    OP_NUMBER,
    OP_ID,
    OP_PARAM_ID,
    OP_CLASS_VAR_ID,
    OP_THIS,
    OP_NULL,
    OP_ASSIGN,
    OP_IF,
    OP_IF_ID,
    OP_IF_ELSE,
    OP_LOOP,
    OP_LOOP_ID
} operators_t;

typedef struct tree_t
{
    int op;
    struct tree_t *kids[2];
    STATEPTR_TYPE state;

    char *identifierName;
    long value;

    int classVaroffset;

    int localVarOffset;

    int parameterIndex;
    char *regStor;
} tree_t;

typedef tree_t *NODEPTR_TYPE;

#define OP_LABEL(p) ((p)->op)
#define LEFT_CHILD(p) ((p)->kids[0])
#define RIGHT_CHILD(p) ((p)->kids[1])
#define STATE_LABEL(p) ((p)->state)
#define PANIC printf

#define VARIABLE 0
#define PARAMETER 1
#define INTERFACE_DING 2
#define CLASS_DING 3
#define ABSTRACT_METH 4
#define CLASS_VAR 5

tree_t *createNode(operators_t op, tree_t *left, tree_t *right);
tree_t *createNumericalLeaf(long value);

tree_t *createIfLabelLeaf(char *name);
tree_t *createLoopLabelLeaf(char *name);

tree_t *createLocalVarIdentifierLeaf(char *name, int offset);
tree_t *createClassVarIdentifierLead(char *name, int offset);
tree_t *createParamIdentifierLeaf(char *name, int parameterIndex);
tree_t *createComplexIdentifierLeaf(char *name, int type, int parameterIndex, int offset);
tree_t *createNULLLeaf();

tree_t *createThisLeaf();

void print2D(struct tree_t *root);

void print2DUtil(tree_t *root, int space);

tree_t *createNodeDEV(operators_t op, tree_t *left, tree_t *right);

void printElem(tree_t *root);

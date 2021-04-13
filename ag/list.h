#include <stdbool.h>

#define VARIABLE 0
#define PARAMETER 1
#define INTERFACE_DING 2
#define CLASS_DING 3
#define ABSTRACT_METH 4
#define CLASS_VAR 5

#define DEBUG 1

typedef struct node_t
{
    char *name;
    short type;
    int lineNr;
    struct node_t *next;
} node_t;

node_t *newList();

node_t *add(node_t *, char *, short, int);
node_t *addDev(node_t *, char *, short, int, char *);

node_t *merge(node_t *, node_t *);
node_t *mergeDev(node_t *, node_t *, char *);

node_t *mergeThree(node_t *, node_t *, node_t *);
node_t *mergeThreeDev(node_t *, node_t *, node_t *, char *);

node_t *duplicate(node_t *);

bool isEmpty(node_t *);

void isVisible(node_t *, char *, short, int);
void isVisibleForZuweisungOrZugriff(node_t *list, char *name, int lineNr);
void printItems(node_t *);

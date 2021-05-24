/* output from Ox version G1.04 */
%{
#include <stdio.h>
#include <string.h>

#include "y.tab.h"

#include "list.h"
#include "tree.h"
#include "implemented_meth_list.h"

%}

/**************************/
/******* defintion *******/
/************************/

%{


struct yyyT1 { long value; }; 
typedef struct yyyT1 *yyyP1; 


struct yyyT2 { char *name; int lineNr; }; 
typedef struct yyyT2 *yyyP2; 


struct yyyT3 { node_t* in; node_t* out; meth_node_t* inImplList; meth_node_t* outImplList; }; 
typedef struct yyyT3 *yyyP3; 


struct yyyT4 { node_t* in; node_t* out; }; 
typedef struct yyyT4 *yyyP4; 


struct yyyT5 { node_t* in; }; 
typedef struct yyyT5 *yyyP5; 


struct yyyT6 { node_t* ids; }; 
typedef struct yyyT6 *yyyP6; 


struct yyyT7 { node_t* in; char* currentClassName; char* currentFunctionName; long ifcounter; }; 
typedef struct yyyT7 *yyyP7; 


struct yyyT8 { node_t* in; node_t* out; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; }; 
typedef struct yyyT8 *yyyP8; 


struct yyyT9 { node_t* in; node_t* out; tree_t* tree; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; }; 
typedef struct yyyT9 *yyyP9; 


struct yyyT10 { node_t* in; node_t* out; char* currentClassName; meth_node_t* inImplList; meth_node_t* outImplList; }; 
typedef struct yyyT10 *yyyP10; 


struct yyyT11 { node_t* ids; tree_t *tree; }; 
typedef struct yyyT11 *yyyP11; 
                                                      /*custom*/  
typedef unsigned char yyyWAT; 
typedef unsigned char yyyRCT; 
typedef unsigned short yyyPNT; 
typedef unsigned char yyyWST; 

#include <limits.h>
#define yyyR UCHAR_MAX  

 /* funny type; as wide as the widest of yyyWAT,yyyWST,yyyRCT  */ 
typedef unsigned short yyyFT;

                                                      /*stock*/  




struct yyyGenNode {void *parent;  
                   struct yyyGenNode **cL; /* child list */ 
                   yyyRCT *refCountList; 
                   yyyPNT prodNum;                      
                   yyyWST whichSym; /* which child of parent? */ 
                  }; 

typedef struct yyyGenNode yyyGNT; 



struct yyyTB {int isEmpty; 
              int typeNum; 
              int nAttrbs; 
              char *snBufPtr; 
              yyyWAT *startP,*stopP; 
             };  




extern struct yyyTB yyyTermBuffer; 
extern yyyWAT yyyLRCIL[]; 
extern void yyyGenLeaf(); 


%}
%%
"if"                          {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return IF;}  }
"int"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return INT;}  }
"interface"                   {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return INTERFACE;}  }
"end"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return END;}  }
"class"                       {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return CLASS;}  }
"implements"                  {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return IMPLEMENTS;}  }
"var"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return VAR;}  }
"method"                      {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return METHOD;}  }
"return"                      {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return RETURN;}  }
"then"                        {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return THEN;}  }
"else"                        {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ELSE;}  }
"while"                       {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return WHILE;}  }
"do"                          {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return DO;}  }
"not"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return NOT;}  }
"and"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return AND;}  }
"new"                         {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return NEW;}  }
"this"                        {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return THIS;}  }
"null"                        {   {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return NULL_VAL;}  }

\;                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ';';}
\:                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ':';}
\(                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '(';}
\)                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ')';}
\.                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '.';}
\,                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ',';}  
\:\=                           {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return ASSIGNOP;}
\+                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '+';}
\*                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '*';}
\-                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '-';}
\<                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '<';}
\=                             {yyyGenLeaf(0,0,yyyLRCIL+0,yyyLRCIL+0);return '=';}  


[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ } /*https://stackoverflow.com/questions/25395251/detecting-and-skipping-line-comments-with-flex */
[/][*]                                    { exit(1); }


[A-Za-z]+[A-Za-z0-9]*       {yyyGenLeaf(2,2,yyyLRCIL+0,yyyLRCIL+2); (((yyyP2)(yyyTermBuffer.snBufPtr))->name) = strdup(yytext); (((yyyP2)(yyyTermBuffer.snBufPtr))->lineNr) = yylineno; return ID;} 

\n                          ;
[ \t]                       ;

[0-9][0-9a-fA-F]*H          {yyyGenLeaf(1,1,yyyLRCIL+2,yyyLRCIL+3); (((yyyP1)(yyyTermBuffer.snBufPtr))->value) = strtoul(yytext, NULL, 16); return NUM;} 

[0-9]+                      {yyyGenLeaf(1,1,yyyLRCIL+2,yyyLRCIL+3); (((yyyP1)(yyyTermBuffer.snBufPtr))->value) = strtoul(yytext, NULL, 10); return NUM;} 


.                           {
                                printf("ERROR on line %d Can not lex the symbol: %s\n",yylineno,yytext);
                                exit(1);
                            }

%% 

void yyerror (char const *message)
{

    fprintf(stderr, "Error parsing line: %d char: %s\n%s\n", yylineno,yytext, message);
    exit(2);
}
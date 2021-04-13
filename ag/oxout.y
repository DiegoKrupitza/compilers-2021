/* output from Ox version G1.04 */
%{
%}
/*************************/
/******* notes **********/
/*  [] = 1 or 0 mal ****/
/*  {} = zero or more */
/*********************/
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "list.h"

void yyerror(char const*);

extern int yylex();

%}

/*%define parse.error verbose
%locations*/

%token      INTERFACE CLASS IMPLEMENTS VAR METHOD INT RETURN IF THEN ELSE WHILE DO NOT AND NEW THIS NULL_VAL END NUM ID
%token      ':' '(' ')' ',' ';' '.'
%token      '+' '*' '-' '<' '=' 
%token      ASSIGNOP
%left       '+'
%left       '*'
%left       '-'
%left       '<'
%right      '='
%start      yyyAugNonterm



 
 
    
   




%{


struct yyyT1 { char *name; int lineNr; }; 
typedef struct yyyT1 *yyyP1; 


struct yyyT2 { node_t* in; }; 
typedef struct yyyT2 *yyyP2; 


struct yyyT3 { node_t* in; node_t* out; }; 
typedef struct yyyT3 *yyyP3; 


struct yyyT4 { node_t* in; }; 
typedef struct yyyT4 *yyyP4; 
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

%{
#include <stdio.h>

int yyyYok = 1;
int yyyInitDone = 0;
char *yyySTsn;
yyyGNT *yyySTN;
int yyyGNSz = sizeof(yyyGNT);
int yyyProdNum,yyyRHSlength,yyyNattrbs,yyyTypeNum; 

extern yyyFT yyyRCIL[];

void yyyExecuteRRsection();
void yyyYoxInit();
void yyyYoxReset();
void yyyDecorate();
void yyyGenIntNode();
void yyyAdjustINRC();
void yyyPrune();
void yyyUnsolvedInstSearchTrav();
void yyyUnsolvedInstSearchTravAux();
void yyyerror();
void yyyShift();



#define yyyRSU(NUM1,NUM2,NUM3,NUM4) \
   yyyProdNum=NUM1;yyyRHSlength=NUM2;yyyNattrbs=NUM3;yyyTypeNum=NUM4;\
   if ((yychar <= 0) && (!yyyTermBuffer.isEmpty)) yyyShift(); 
%}


%%

yyyAugNonterm 
	:	{if (!yyyInitDone) 
		    {yyyYoxInit(); 
		     yyyInitDone = 1;
		    }
		 yyyYoxReset();
		}
		Start
		{
		 yyyDecorate(); yyyExecuteRRsection();
		}
	;
Start                   :   Programm
                        {if(yyyYok){
yyyRSU(1,1,0,0);
yyyGenIntNode();
 (((yyyP2)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->in) = newList();
                        yyyAdjustINRC(yyyRCIL+0,yyyRCIL+3);/*yyyPrune(1);*/}}
                        ;

Programm                :   ProgrammStart Programm
                        {if(yyyYok){
yyyRSU(2,2,1,2);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+3,yyyRCIL+9);}}
                        |
                        {if(yyyYok){
yyyRSU(3,0,1,2);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+9,yyyRCIL+9);}};

ProgrammStart           :   Interface ';'
                            {if(yyyYok){
yyyRSU(4,2,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+9,yyyRCIL+15);}}
                        |   Class ';'
                        {if(yyyYok){
yyyRSU(5,2,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+15,yyyRCIL+15);/*yyyPrune(5);*/}};

Interface               :   INTERFACE ID ':'
                                AbstraktMethodsLoop
                            END
                        {if(yyyYok){
yyyRSU(6,5,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+15,yyyRCIL+21);}}
                        ;

AbstraktMethodsLoop     :   AbstraktMethod AbstraktMethodsLoop
                            {if(yyyYok){
yyyRSU(7,2,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+21,yyyRCIL+30);}}
                        |
                        {if(yyyYok){
yyyRSU(8,0,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+30,yyyRCIL+33);}}
                        ;

AbstraktMethod          :   ID '(' ParamTypesLoop ')' ':' Type
                        {if(yyyYok){
yyyRSU(9,6,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+33,yyyRCIL+42);}}
                        |   ID '(' ')' ':' Type
                        {if(yyyYok){
yyyRSU(10,5,2,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+42,yyyRCIL+48);}}
                        ;

ParamTypesLoop          :   TypesLoop Type 
                        {if(yyyYok){
yyyRSU(11,2,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+48,yyyRCIL+54);}}
                        |   Type
                        {if(yyyYok){
yyyRSU(12,1,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+54,yyyRCIL+57);}}
                        ;

TypesLoop               :   TypesLoop Type ','
                        {if(yyyYok){
yyyRSU(13,3,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+57,yyyRCIL+63);}}
                        |   Type ',' 
                        {if(yyyYok){
yyyRSU(14,2,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+63,yyyRCIL+66);}}
                        ;

Class                   :   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                                MemeberLoop
                            END
                        {if(yyyYok){
yyyRSU(15,7,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(15);*/}}|   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        {if(yyyYok){
yyyRSU(16,6,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(16);*/}}|   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        {if(yyyYok){
yyyRSU(17,6,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(17);*/}}|   CLASS ID
                            IMPLEMENTS ':'
                            END
                        {if(yyyYok){
yyyRSU(18,5,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(18);*/}};

MemeberLoop             :   MemeberLoop Member ';' 
                        {if(yyyYok){
yyyRSU(19,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(19);*/}}|   Member ';'
                        {if(yyyYok){
yyyRSU(20,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(20);*/}};

ImplementsLoop          :   ImplementsLoop ID
                        {if(yyyYok){
yyyRSU(21,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(21);*/}}|   ID
                        {if(yyyYok){
yyyRSU(22,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(22);*/}};

Member                  :   VAR ID ':' Type
                        {if(yyyYok){
yyyRSU(23,4,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(23);*/}}|   METHOD ID '(' ')' Stats END
                        {if(yyyYok){
yyyRSU(24,6,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(24);*/}}|   METHOD ID '(' Pars ')' Stats END
                        {if(yyyYok){
yyyRSU(25,7,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(25);*/}};

Type                    :   INT
                        {if(yyyYok){
yyyRSU(26,1,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(26);*/}}|   ID
                        {if(yyyYok){
yyyRSU(27,1,1,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(27);*/}}
                        ;

Pars                    :   ParsLoop Par
                        {if(yyyYok){
yyyRSU(28,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(28);*/}}|   Par
                        {if(yyyYok){
yyyRSU(29,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(29);*/}};

ParsLoop                :   ParsLoop Par ','
                        {if(yyyYok){
yyyRSU(30,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(30);*/}}|   Par ','
                        {if(yyyYok){
yyyRSU(31,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(31);*/}};

Par                     :   ID ':' Type
                        {if(yyyYok){
yyyRSU(32,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(32);*/}};

Stats                   :   Stat ';' Stats
                        {if(yyyYok){
yyyRSU(33,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(33);*/}}|
                        {if(yyyYok){
yyyRSU(34,0,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);}};

Stat                    :   RETURN Expr
                        {if(yyyYok){
yyyRSU(35,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(35);*/}}|   IF Expr THEN Stats END
                        {if(yyyYok){
yyyRSU(36,5,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(36);*/}}|   IF Expr THEN Stats ELSE Stats END
                        {if(yyyYok){
yyyRSU(37,7,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(37);*/}}|   WHILE Expr DO Stats END
                        {if(yyyYok){
yyyRSU(38,5,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(38);*/}}|   VAR ID ':' Type ASSIGNOP Expr
                        {if(yyyYok){
yyyRSU(39,6,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(39);*/}}|   ID ASSIGNOP Expr
                        {if(yyyYok){
yyyRSU(40,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(40);*/}}|   Expr
                        {if(yyyYok){
yyyRSU(41,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(41);*/}};

Expr                    :   Term
                        {if(yyyYok){
yyyRSU(42,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(42);*/}}|   OptionaNot Term
                        {if(yyyYok){
yyyRSU(43,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(43);*/}}|   Term OptionalPlusTerm
                        {if(yyyYok){
yyyRSU(44,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(44);*/}}|   Term OptionalMalTerm
                        {if(yyyYok){
yyyRSU(45,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(45);*/}}|   Term OptionalAndTerm
                        {if(yyyYok){
yyyRSU(46,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(46);*/}}|   Term SpecialOperation Term
                        {if(yyyYok){
yyyRSU(47,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(47);*/}}|   NEW ID
                        {if(yyyYok){
yyyRSU(48,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(48);*/}};

OptionaNot              :   NOT OptionaNot
                        {if(yyyYok){
yyyRSU(49,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(49);*/}}|   NOT
                        {if(yyyYok){
yyyRSU(50,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(50);*/}};

OptionalPlusTerm        :   '+' Term OptionalPlusTerm
                        {if(yyyYok){
yyyRSU(51,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(51);*/}}|   '+' Term
                        {if(yyyYok){
yyyRSU(52,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(52);*/}};

OptionalMalTerm         :   '*' Term OptionalMalTerm
                        {if(yyyYok){
yyyRSU(53,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(53);*/}}|   '*' Term
                        {if(yyyYok){
yyyRSU(54,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(54);*/}};

OptionalAndTerm         :   AND Term OptionalAndTerm
                        {if(yyyYok){
yyyRSU(55,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(55);*/}}|   AND Term
                        {if(yyyYok){
yyyRSU(56,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(56);*/}};

SpecialOperation        :   '-'
                        {if(yyyYok){
yyyRSU(57,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(57);*/}}|   '<'
                        {if(yyyYok){
yyyRSU(58,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(58);*/}}|   '='
                        {if(yyyYok){
yyyRSU(59,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(59);*/}};

Term                    :   '(' Expr ')'
                        {if(yyyYok){
yyyRSU(60,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(60);*/}}|   NUM
                        {if(yyyYok){
yyyRSU(61,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(61);*/}}|   THIS
                        {if(yyyYok){
yyyRSU(62,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(62);*/}}|   NULL_VAL ID
                        {if(yyyYok){
yyyRSU(63,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(63);*/}}|   ID
                        {if(yyyYok){
yyyRSU(64,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(64);*/}}|   Term '.' ID '(' ')'
                        {if(yyyYok){
yyyRSU(65,5,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(65);*/}}|   Term '.' ID '(' ParamsExpr ')'
                        {if(yyyYok){
yyyRSU(66,6,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(66);*/}};

ParamsExpr              :   Expr
                        {if(yyyYok){
yyyRSU(67,1,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(67);*/}}|   ParamsExprLoop Expr
                        {if(yyyYok){
yyyRSU(68,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(68);*/}};

ParamsExprLoop          :   Expr ','
                        {if(yyyYok){
yyyRSU(69,2,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(69);*/}}|   ParamsExprLoop Expr ',' 
                        {if(yyyYok){
yyyRSU(70,3,0,0);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+66);/*yyyPrune(70);*/}};


%%
int main(void) {
        yyparse();
        return 0;
}
                                                      /*custom*/  
long yyyMaxNbytesNodeStg = 2000000; 
long yyyMaxNrefCounts =    500000; 
long yyyMaxNchildren =     60000; 
long yyyMaxStackSize =     2000; 
long yyySSALspaceSize =    20000; 
long yyyRSmaxSize =        1000; 
long yyyTravStackMaxSize = 2000; 


struct yyyTB yyyTermBuffer; 

char *yyyNodeAndStackSpace; 

char *yyyNodeSpace;
char *yyyNextNodeSpace; 
char *yyyAfterNodeSpace; 


 
struct yyyGenNode **yyyChildListSpace;  
struct yyyGenNode **yyyNextCLspace; 
struct yyyGenNode **yyyAfterChildListSpace; 



yyyRCT *yyyRefCountListSpace;
yyyRCT *yyyNextRCLspace;  
yyyRCT *yyyAfterRefCountListSpace;   



struct yyySolvedSAlistCell {yyyWAT attrbNum; 
                            long next; 
                           }; 
#define yyyLambdaSSAL 0 
long yyySSALCfreeList = yyyLambdaSSAL; 
long yyyNewSSALC = 1; 
 
struct yyySolvedSAlistCell *yyySSALspace; 


 
struct yyyStackItem {struct yyyGenNode *node; 
                     long solvedSAlist; 
                     struct yyyGenNode *oldestNode; 
                    };  

long yyyNbytesStackStg; 
struct yyyStackItem *yyyStack; 
struct yyyStackItem *yyyAfterStack; 
struct yyyStackItem *yyyStackTop; 



struct yyyRSitem {yyyGNT *node; 
                  yyyWST whichSym; 
                  yyyWAT wa;  
                 };  

struct yyyRSitem *yyyRS;  
struct yyyRSitem *yyyRSTop;  
struct yyyRSitem *yyyAfterRS;  
 





yyyFT yyyRCIL[] = {
0,0,0, 0,0,1, 1,0,1, yyyR,1,1, 0,0,1, yyyR,1,1, 
3,0,1, yyyR,1,1, 0,0,1, 1,0,1, yyyR,1,1, yyyR,1,1, 
2,0,1, 5,0,1, yyyR,1,1, 4,0,1, 0,0,1, 1,0,1, 
0,0,1, 0,0,1, 1,0,1, 0,0,1, 
};

short yyyIIIEL[] = {0,
0,2,5,6,9,12,18,21,22,29,
35,38,40,44,47,55,62,69,75,79,
82,85,87,92,99,107,109,111,114,116,
120,123,127,131,132,135,141,149,155,162,
166,168,170,173,176,179,182,186,189,192,
194,198,201,205,208,212,215,217,219,221,
225,227,229,232,234,240,247,249,252,255,

};

long yyyIIEL[] = {
0,0,1,2,4,5,6,8,10,10,12,12,
12,14,14,16,16,18,18,20,22,24,26,28,
30,30,31,31,31,32,34,36,36,36,36,37,
38,39,40,41,42,43,44,45,45,46,47,47,
47,47,49,49,49,49,49,49,49,49,51,51,
51,51,51,51,51,53,53,53,53,53,53,53,
55,55,55,55,55,55,55,55,55,55,55,55,
55,57,57,59,59,59,61,61,62,62,62,64,
64,64,64,64,64,64,66,66,66,66,66,66,
67,67,68,70,70,70,70,70,70,70,70,70,
70,70,70,70,70,72,72,73,73,73,73,73,
73,73,73,73,73,73,73,73,73,73,73,73,
73,73,73,73,73,73,73,73,73,73,73,73,
73,73,75,75,76,76,76,76,78,78,78,78,
78,78,78,78,78,78,78,78,78,78,78,78,
78,78,78,78,78,78,78,78,78,80,80,80,
80,80,80,80,80,80,80,80,80,80,80,80,
80,80,80,80,80,80,80,80,80,80,80,80,
80,80,80,80,80,80,80,80,80,80,80,80,
80,80,80,80,82,82,84,84,84,84,86,86,
86,86,86,86,88,88,88,88,88,88,88,88,
88,88,88,88,88,88,88,
};

long yyyIEL[] = {
0,0,2,2,4,4,4,6,
6,6,8,8,8,10,10,12,
14,14,16,18,18,18,20,20,
22,24,24,26,30,32,34,34,
34,38,38,40,42,42,46,46,
46,48,48,52,52,52,54,54,
54,54,54,54,54,54,54,54,
54,54,54,54,54,54,54,54,
54,54,54,54,54,54,54,54,
54,54,54,54,54,54,54,54,
54,54,54,54,54,54,54,54,
54,
};

yyyFT yyyEntL[] = {
1,0,2,0,1,0,0,1,4,0,4,0,4,0,0,1,
1,0,2,0,0,1,0,1,0,1,6,0,3,0,0,1,
0,1,0,1,5,0,0,1,0,1,2,0,1,0,1,0,
2,0,1,0,1,0,
};

#define yyyPermitUserAlloc  0 


void yyyfatal(msg)
  char *msg; 
{fprintf(stderr,msg);exit(-1);} 



#define yyyNSof   'n' 
#define yyyRCof   'r' 
#define yyyCLof   'c' 
#define yyySof    's' 
#define yyySSALof 'S' 
#define yyyRSof   'q' 
#define yyyTSof   't' 



void yyyHandleOverflow(which) 
  char which; 
  {char *msg1,*msg2; 
   long  oldSize,newSize; 
   switch(which) 
     {
      case yyyNSof   : 
           msg1 = "node storage overflow: ";
           oldSize = yyyMaxNbytesNodeStg; 
           break; 
      case yyyRCof   : 
           msg1 = "dependee count overflow: ";
           oldSize = yyyMaxNrefCounts; 
           break; 
      case yyyCLof   : 
           msg1 = "child list overflow: ";
           oldSize = yyyMaxNchildren; 
           break; 
      case yyySof    : 
           msg1 = "parse-tree stack overflow: ";
           oldSize = yyyMaxStackSize; 
           break; 
      case yyySSALof : 
           msg1 = "SSAL overflow: ";
           oldSize = yyySSALspaceSize; 
           break; 
      case yyyRSof   : 
           msg1 = "ready set overflow: ";
           oldSize = yyyRSmaxSize; 
           break; 
      case yyyTSof   : 
           msg1 = "traversal stack overflow: ";
           oldSize = yyyTravStackMaxSize; 
           break; 
      default        :;  
     }
   newSize = (3*oldSize)/2; 
   if (newSize < 100) newSize = 100; 
   fprintf(stderr,msg1); 
   fprintf(stderr,"size was %d.\n",oldSize); 
   if (yyyPermitUserAlloc) 
      msg2 = "     Try -Y%c%d option.\n"; 
      else 
      msg2 = "     Have to modify evaluator:  -Y%c%d.\n"; 
   fprintf(stderr,msg2,which,newSize); 
   exit(-1); 
  }



void yyySignalEnts(node,startP,stopP) 
  register yyyGNT *node; 
  register yyyFT *startP,*stopP;  
  {register yyyGNT *dumNode; 

   while (startP < stopP)  
     {
      if (!(*startP)) dumNode = node;  
         else dumNode = (node->cL)[(*startP)-1];   
      if (!(--((dumNode->refCountList)[*(startP+1)]
              ) 
           )
         ) 
         { 
          if (++yyyRSTop == yyyAfterRS) 
             {yyyHandleOverflow(yyyRSof); 
              break; 
             }
          yyyRSTop->node = dumNode; 
          yyyRSTop->whichSym = *startP;  
          yyyRSTop->wa = *(startP+1);  
         }  
      startP += 2;  
     }  
  } 




#define yyyCeiling(num,inc) (((inc) * ((num)/(inc))) + (((num)%(inc))?(inc):0)) 



int yyyAlignSize = 8;
int yyyNdSz[5];

int yyyNdPrSz[5];

typedef int yyyCopyType;

int yyyNdCopySz[5];
long yyyBiggestNodeSize = 0;

void yyyNodeSizeCalc()
  {int i;
   yyyGNSz = yyyCeiling(yyyGNSz,yyyAlignSize); 
   yyyNdSz[0] = 0;
   yyyNdSz[1] = sizeof(struct yyyT1);
   yyyNdSz[2] = sizeof(struct yyyT2);
   yyyNdSz[3] = sizeof(struct yyyT3);
   yyyNdSz[4] = sizeof(struct yyyT4);
   for (i=0;i<5;i++) 
       {yyyNdSz[i] = yyyCeiling(yyyNdSz[i],yyyAlignSize); 
        yyyNdPrSz[i] = yyyNdSz[i] + yyyGNSz;
        if (yyyBiggestNodeSize < yyyNdSz[i])
           yyyBiggestNodeSize = yyyNdSz[i];
        yyyNdCopySz[i] = yyyCeiling(yyyNdSz[i],sizeof(yyyCopyType)) / 
                         sizeof(yyyCopyType); 
       }
  }




void yyySolveAndSignal() {
register long yyyiDum,*yyypL;
register int yyyws,yyywa;
register yyyGNT *yyyRSTopN,*yyyRefN; 
register void *yyyRSTopNp; 


yyyRSTopNp = (yyyRSTopN = yyyRSTop->node)->parent;
yyyRefN= (yyyws = (yyyRSTop->whichSym))?((yyyGNT *)yyyRSTopNp):yyyRSTopN;
yyywa = yyyRSTop->wa; 
yyyRSTop--;
switch(yyyRefN->prodNum) {
case 1:  /***yacc rule 1***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 2:  /***yacc rule 2***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP2)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP2)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  }
break;
case 3:  /***yacc rule 3***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 4:  /***yacc rule 4***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                    break;
    }
  break;
  }
break;
case 5:  /***yacc rule 5***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 6:  /***yacc rule 6***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = add((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP1)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),INTERFACE,(((yyyP1)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr));
                                break;
    }
  break;
  }
break;
case 7:  /***yacc rule 7***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                    break;
    }
  break;
  }
break;
case 8:  /***yacc rule 8***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 9:  /***yacc rule 9***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = add((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP1)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP1)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr));
                                yyySignalEnts(yyyRefN,yyyEntL+26,yyyEntL+30);
    break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->out) ;
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->out) ;
                            break;
    }
  break;
  }
break;
case 10:  /***yacc rule 10***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = add((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP1)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP1)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr));
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 11:  /***yacc rule 11***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 12:  /***yacc rule 12***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 13:  /***yacc rule 13***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 14:  /***yacc rule 14***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 15:  /***yacc rule 15***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 16:  /***yacc rule 16***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 17:  /***yacc rule 17***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 18:  /***yacc rule 18***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 19:  /***yacc rule 19***/
  switch (yyyws) {
  }
break;
case 20:  /***yacc rule 20***/
  switch (yyyws) {
  }
break;
case 21:  /***yacc rule 21***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 22:  /***yacc rule 22***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 23:  /***yacc rule 23***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 24:  /***yacc rule 24***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 25:  /***yacc rule 25***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 26:  /***yacc rule 26***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 27:  /***yacc rule 27***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 28:  /***yacc rule 28***/
  switch (yyyws) {
  }
break;
case 29:  /***yacc rule 29***/
  switch (yyyws) {
  }
break;
case 30:  /***yacc rule 30***/
  switch (yyyws) {
  }
break;
case 31:  /***yacc rule 31***/
  switch (yyyws) {
  }
break;
case 32:  /***yacc rule 32***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 33:  /***yacc rule 33***/
  switch (yyyws) {
  }
break;
case 34:  /***yacc rule 34***/
  switch (yyyws) {
  }
break;
case 35:  /***yacc rule 35***/
  switch (yyyws) {
  }
break;
case 36:  /***yacc rule 36***/
  switch (yyyws) {
  }
break;
case 37:  /***yacc rule 37***/
  switch (yyyws) {
  }
break;
case 38:  /***yacc rule 38***/
  switch (yyyws) {
  }
break;
case 39:  /***yacc rule 39***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 40:  /***yacc rule 40***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 41:  /***yacc rule 41***/
  switch (yyyws) {
  }
break;
case 42:  /***yacc rule 42***/
  switch (yyyws) {
  }
break;
case 43:  /***yacc rule 43***/
  switch (yyyws) {
  }
break;
case 44:  /***yacc rule 44***/
  switch (yyyws) {
  }
break;
case 45:  /***yacc rule 45***/
  switch (yyyws) {
  }
break;
case 46:  /***yacc rule 46***/
  switch (yyyws) {
  }
break;
case 47:  /***yacc rule 47***/
  switch (yyyws) {
  }
break;
case 48:  /***yacc rule 48***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 49:  /***yacc rule 49***/
  switch (yyyws) {
  }
break;
case 50:  /***yacc rule 50***/
  switch (yyyws) {
  }
break;
case 51:  /***yacc rule 51***/
  switch (yyyws) {
  }
break;
case 52:  /***yacc rule 52***/
  switch (yyyws) {
  }
break;
case 53:  /***yacc rule 53***/
  switch (yyyws) {
  }
break;
case 54:  /***yacc rule 54***/
  switch (yyyws) {
  }
break;
case 55:  /***yacc rule 55***/
  switch (yyyws) {
  }
break;
case 56:  /***yacc rule 56***/
  switch (yyyws) {
  }
break;
case 57:  /***yacc rule 57***/
  switch (yyyws) {
  }
break;
case 58:  /***yacc rule 58***/
  switch (yyyws) {
  }
break;
case 59:  /***yacc rule 59***/
  switch (yyyws) {
  }
break;
case 60:  /***yacc rule 60***/
  switch (yyyws) {
  }
break;
case 61:  /***yacc rule 61***/
  switch (yyyws) {
  }
break;
case 62:  /***yacc rule 62***/
  switch (yyyws) {
  }
break;
case 63:  /***yacc rule 63***/
  switch (yyyws) {
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 64:  /***yacc rule 64***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 65:  /***yacc rule 65***/
  switch (yyyws) {
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 66:  /***yacc rule 66***/
  switch (yyyws) {
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 67:  /***yacc rule 67***/
  switch (yyyws) {
  }
break;
case 68:  /***yacc rule 68***/
  switch (yyyws) {
  }
break;
case 69:  /***yacc rule 69***/
  switch (yyyws) {
  }
break;
case 70:  /***yacc rule 70***/
  switch (yyyws) {
  }
break;
} /* switch */ 

if (yyyws)  /* the just-solved instance was inherited. */ 
   {if (yyyRSTopN->prodNum) 
       {yyyiDum = yyyIIEL[yyyIIIEL[yyyRSTopN->prodNum]] + yyywa;
        yyySignalEnts(yyyRSTopN,yyyEntL + yyyIEL[yyyiDum],
                                yyyEntL + yyyIEL[yyyiDum+1]
                     );
       }
   } 
   else     /* the just-solved instance was synthesized. */ 
   {if ((char *)yyyRSTopNp >= yyyNodeSpace) /* node has a parent. */ 
       {yyyiDum = yyyIIEL[yyyIIIEL[((yyyGNT *)yyyRSTopNp)->prodNum] + 
                          yyyRSTopN->whichSym 
                         ] + 
                  yyywa;
        yyySignalEnts((yyyGNT *)yyyRSTopNp,
                      yyyEntL + yyyIEL[yyyiDum],
                      yyyEntL + yyyIEL[yyyiDum+1] 
                     );
       } 
       else   /* node is still on the stack--it has no parent yet. */ 
       {yyypL = &(((struct yyyStackItem *)yyyRSTopNp)->solvedSAlist); 
        if (yyySSALCfreeList == yyyLambdaSSAL) 
           {yyySSALspace[yyyNewSSALC].next = *yyypL; 
            if ((*yyypL = yyyNewSSALC++) == yyySSALspaceSize) 
               yyyHandleOverflow(yyySSALof); 
           }  
           else
           {yyyiDum = yyySSALCfreeList; 
            yyySSALCfreeList = yyySSALspace[yyySSALCfreeList].next; 
            yyySSALspace[yyyiDum].next = *yyypL; 
            *yyypL = yyyiDum;  
           } 
        yyySSALspace[*yyypL].attrbNum = yyywa; 
       } 
   }

} /* yyySolveAndSignal */ 






#define condStg unsigned int conds;
#define yyyClearConds {yyyTST->conds = 0;}
#define yyySetCond(n) {yyyTST->conds += (1<<(n));}
#define yyyCond(n) ((yyyTST->conds & (1<<(n)))?1:0)



struct yyyTravStackItem {yyyGNT *node; 
                         char isReady;
                         condStg
                        };



void yyyDoTraversals()
{struct yyyTravStackItem *yyyTravStack,*yyyTST,*yyyAfterTravStack;
 register yyyGNT *yyyTSTn,**yyyCLptr1,**yyyCLptr2; 
 register int yyyi,yyyRL,yyyPass;

 if (!yyyYok) return;
 if ((yyyTravStack = 
                 ((struct yyyTravStackItem *) 
                  malloc((yyyTravStackMaxSize * 
                                  sizeof(struct yyyTravStackItem)
                                 )
                        )
                 )
     )
     == 
     (struct yyyTravStackItem *)NULL
    ) 
    {fprintf(stderr,"malloc error in traversal stack allocation\n"); 
     exit(-1); 
    } 

yyyAfterTravStack = yyyTravStack + yyyTravStackMaxSize; 
yyyTravStack++; 


for (yyyi=0; yyyi<1; yyyi++) {
yyyTST = yyyTravStack; 
yyyTST->node = yyyStack->node;
yyyTST->isReady = 0;
yyyClearConds

while(yyyTST >= yyyTravStack)
  {yyyTSTn = yyyTST->node;
   if (yyyTST->isReady)  
      {yyyPass = 1;
       goto yyyTravSwitch;
yyyTpop:
       yyyTST--;
      } 
      else 
      {yyyPass = 0;
       goto yyyTravSwitch;
yyyTpush:
       yyyTST->isReady = 1;  
       if (yyyTSTn->prodNum)
          if (yyyRL)
             {yyyCLptr2 = yyyTSTn->cL; 
              while 
                ((yyyCLptr2 != yyyNextCLspace)
                 &&
                 ((*yyyCLptr2)->parent == yyyTSTn) 
                )  
                {if (++yyyTST == yyyAfterTravStack)
                    yyyHandleOverflow(yyyTSof);
                    else
                    {yyyTST->node = *yyyCLptr2; 
                     yyyTST->isReady = 0; 
                     yyyClearConds
                    }
                 yyyCLptr2++; 
                } 
             } /* right to left */
             else  /* left to right */
             {yyyCLptr1 = yyyCLptr2 = yyyTSTn->cL; 
              while 
                ((yyyCLptr2 != yyyNextCLspace)
                 &&
                 ((*yyyCLptr2)->parent == yyyTSTn) 
                )  
                yyyCLptr2++; 
              while (yyyCLptr2-- > yyyCLptr1)
                if (++yyyTST == yyyAfterTravStack)
                   yyyHandleOverflow(yyyTSof);
                   else
                   {yyyTST->node = *yyyCLptr2; 
                    yyyTST->isReady = 0; 
                    yyyClearConds
                   }
             } /* left to right */
      } /* else */
   continue;
yyyTravSwitch:
				switch(yyyTSTn->prodNum)	{
case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 6:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 7:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 8:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 9:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 10:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 11:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 12:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 13:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 14:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 15:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 16:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 17:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 18:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 19:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 20:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 21:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 22:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 23:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 24:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 25:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 26:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 27:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP4)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP1)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name), INTERFACE, (((yyyP1)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                        }
				break;
					}

break;
case 28:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 29:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 30:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 31:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 32:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 33:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 34:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 35:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 36:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 37:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 38:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 39:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 40:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 41:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 42:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 43:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 44:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 45:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 46:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 47:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 48:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 49:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 50:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 51:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 52:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 53:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 54:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 55:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 56:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 57:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 58:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 59:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 60:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 61:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 62:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 63:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 64:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 65:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 66:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 67:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 68:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 69:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
case 70:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}

break;
								} /* switch */ 
   if (yyyPass) goto yyyTpop; else goto yyyTpush; 
  } /* while */ 
 } /* for */ 
} /* yyyDoTraversals */ 

void yyyExecuteRRsection()  {
   int yyyi; 
   long yyynRefCounts; 
   long cycleSum = 0;
   long nNZrc = 0;

   if (!yyyYok) return; 
   yyynRefCounts = yyyNextRCLspace - yyyRefCountListSpace; 
   for (yyyi=0;yyyi<yyynRefCounts;yyyi++) 
     if (yyyRefCountListSpace[yyyi])
        {cycleSum += yyyRefCountListSpace[yyyi]; nNZrc++;} 
   if (nNZrc) 
      {
       fprintf(stderr,"\n\n\n**********\n");
       fprintf(stderr,
               "cycle detected in completed parse tree");
       fprintf(stderr,
               " after decoration.\n");
       fprintf(stderr,
         "searching parse tree for %d unsolved instances:\n",
               nNZrc
              );
       yyyUnsolvedInstSearchTravAux(yyyStackTop->node);
      }
   yyyDoTraversals();
} /* yyyExecuteRRsection */ 



yyyWAT yyyLRCIL[2] = {0,1,
};



void yyyYoxInit()                                  /*stock*/  
  { 

   yyyNodeSizeCalc(); 

   if ((yyyTermBuffer.snBufPtr = 
        (char *) malloc((yyyBiggestNodeSize + sizeof(yyyCopyType)))
       )  
       == 
       ((char *) NULL) 
      )   
      yyyfatal("malloc error in yyyTermBuffer allocation\n");  
  
  
   yyyNbytesStackStg = yyyMaxStackSize*sizeof(struct yyyStackItem); 
   yyyNbytesStackStg = ((yyyNbytesStackStg/yyyAlignSize)+1)*yyyAlignSize;  
   if ((yyyNodeAndStackSpace = 
        (char *) malloc((yyyNbytesStackStg + 
                                 yyyMaxNbytesNodeStg + 
                                 yyyGNSz + 
                                 yyyBiggestNodeSize + 
                                 sizeof(yyyCopyType) 
                                )
                       )
       )  
       == 
       ((char *) NULL) 
      )   
      yyyfatal("malloc error in ox node and stack space allocation\n");
   yyyStack = (struct yyyStackItem *) yyyNodeAndStackSpace; 
   yyyAfterStack = yyyStack + yyyMaxStackSize;  
   yyyNodeSpace = yyyNodeAndStackSpace + yyyNbytesStackStg;
   yyyAfterNodeSpace = yyyNodeSpace + yyyMaxNbytesNodeStg;
 
 
   if ((yyyRS = (struct yyyRSitem *) 
         malloc(((yyyRSmaxSize+1)*sizeof(struct yyyRSitem)))
       )  
       == 
       ((struct yyyRSitem *) NULL) 
      )   
      yyyfatal("malloc error in ox ready set space allocation\n");  
   yyyRS++; 
   yyyAfterRS = yyyRS + yyyRSmaxSize; 

 
   if ((yyyChildListSpace = 
        (yyyGNT **) malloc((yyyMaxNchildren*sizeof(yyyGNT *)))
       )  
       == 
       ((yyyGNT **) NULL) 
      )   
      yyyfatal("malloc error in ox child list space allocation\n");  
   yyyAfterChildListSpace = yyyChildListSpace + yyyMaxNchildren; 

 
   if ((yyyRefCountListSpace = 
        (yyyRCT *) malloc((yyyMaxNrefCounts * sizeof(yyyRCT)))
       )  
       == 
       ((yyyRCT *) NULL) 
      )   
      yyyfatal("malloc error in ox reference count list space allocation\n");  
   yyyAfterRefCountListSpace = yyyRefCountListSpace + yyyMaxNrefCounts;  
  
 
   if ((yyySSALspace = (struct yyySolvedSAlistCell *) 
          malloc(((yyySSALspaceSize+1) * 
                          sizeof(struct yyySolvedSAlistCell))
                         ) 
       ) 
       == 
       ((struct yyySolvedSAlistCell *) NULL) 
      ) 
      yyyfatal("malloc error in stack solved list space allocation\n"); 
  } /* yyyYoxInit */ 



void yyyYoxReset() 
  { 
   yyyTermBuffer.isEmpty = 1; 
   yyyStackTop = yyyStack; 
   while (yyyStackTop != yyyAfterStack) 
     (yyyStackTop++)->solvedSAlist = yyyLambdaSSAL; 
   yyyStackTop = yyyStack - 1; 
   yyyNextNodeSpace = yyyNodeSpace; 
   yyyRSTop = yyyRS - 1; 
   yyyNextCLspace = yyyChildListSpace;
   yyyNextRCLspace = yyyRefCountListSpace; 
  }  



void yyyDecorate() 
  { 
   while (yyyRSTop >= yyyRS) 
      yyySolveAndSignal();  
  } 



void yyyShift() 
  {yyyRCT *rcPdum; 
   register yyyCopyType *CTp1,*CTp2,*CTp3; 
   register yyyWAT *startP,*stopP;  

   if ((++yyyStackTop) == yyyAfterStack) 
      yyyHandleOverflow(yyySof);
   CTp2 = (yyyCopyType *)(yyyStackTop->oldestNode = 
                          yyyStackTop->node = 
                          (yyyGNT *)yyyNextNodeSpace 
                         ); 
   yyyTermBuffer.isEmpty = 1;
   ((yyyGNT *)CTp2)->parent = (void *)yyyStackTop; 
   ((yyyGNT *)CTp2)->cL = yyyNextCLspace;  
   rcPdum = ((yyyGNT *)CTp2)->refCountList = yyyNextRCLspace;  
   ((yyyGNT *)CTp2)->prodNum = 0; 
   if ((yyyNextRCLspace += yyyTermBuffer.nAttrbs) 
       > 
       yyyAfterRefCountListSpace 
      ) 
      yyyHandleOverflow(yyyRCof); 
   startP = yyyTermBuffer.startP;  
   stopP = yyyTermBuffer.stopP;  
   while (startP < stopP) rcPdum[*(startP++)] = 0; 
   if ((yyyNextNodeSpace += yyyNdPrSz[yyyTermBuffer.typeNum]) 
       > 
       yyyAfterNodeSpace 
      ) 
      yyyHandleOverflow(yyyNSof);  
   CTp1 = (yyyCopyType *)(yyyTermBuffer.snBufPtr); 
   CTp2 = (yyyCopyType *)(((char *)CTp2) + yyyGNSz); 
   CTp3 = CTp2 + yyyNdCopySz[yyyTermBuffer.typeNum]; 
   while (CTp2 < CTp3) *CTp2++ = *CTp1++; 
  } 



void yyyGenIntNode() 
  {register yyyWST i;
   register struct yyyStackItem *stDum;  
   register yyyGNT *gnpDum; 

   if ((stDum = (yyyStackTop -= (yyyRHSlength-1))) >= yyyAfterStack) 
      yyyHandleOverflow(yyySof);
   yyySTsn = ((char *)(yyySTN = (yyyGNT *)yyyNextNodeSpace)) + yyyGNSz; 
   yyySTN->parent       =  (void *)yyyStackTop;  
   yyySTN->cL           =  yyyNextCLspace; 
   yyySTN->refCountList =  yyyNextRCLspace; 
   yyySTN->prodNum      =  yyyProdNum; 
   if ((yyyNextCLspace+yyyRHSlength) > yyyAfterChildListSpace) 
      yyyHandleOverflow(yyyCLof); 
   for (i=1;i<=yyyRHSlength;i++) 
     {gnpDum = *(yyyNextCLspace++) = (stDum++)->node;  
      gnpDum->whichSym = i;  
      gnpDum->parent = (void *)yyyNextNodeSpace; 
     } 
   if ((yyyNextRCLspace += yyyNattrbs) > yyyAfterRefCountListSpace) 
      yyyHandleOverflow(yyyRCof); 
   if ((yyyNextNodeSpace += yyyNdPrSz[yyyTypeNum]) > yyyAfterNodeSpace) 
      yyyHandleOverflow(yyyNSof);  
  } 



#define yyyDECORfREQ 50 



void yyyAdjustINRC(startP,stopP) 
  register yyyFT *startP,*stopP;
  {yyyWST i;
   long SSALptr,SSALptrHead,*cPtrPtr; 
   long *pL; 
   struct yyyStackItem *stDum;  
   yyyGNT *gnpDum; 
   long iTemp;
   register yyyFT *nextP;
   static unsigned short intNodeCount = yyyDECORfREQ;

   nextP = startP;
   while (nextP < stopP) 
     {if ((*nextP) == yyyR)  
         {(yyySTN->refCountList)[*(nextP+1)] = *(nextP+2);
         } 
         else 
         {(((yyySTN->cL)[*nextP])->refCountList)[*(nextP+1)] = *(nextP+2);
         } 
      nextP += 3;  
     }
   pL = yyyIIEL + yyyIIIEL[yyyProdNum]; 
   stDum = yyyStackTop;  
   for (i=1;i<=yyyRHSlength;i++) 
     {pL++; 
      SSALptrHead = SSALptr = *(cPtrPtr = &((stDum++)->solvedSAlist)); 
      if (SSALptr != yyyLambdaSSAL) 
         {*cPtrPtr = yyyLambdaSSAL; 
          do 
            {
             iTemp = (*pL+yyySSALspace[SSALptr].attrbNum);
             yyySignalEnts(yyySTN,
                           yyyEntL + yyyIEL[iTemp],
                           yyyEntL + yyyIEL[iTemp+1]
                          );  
             SSALptr = *(cPtrPtr = &(yyySSALspace[SSALptr].next)); 
            } 
            while (SSALptr != yyyLambdaSSAL);  
          *cPtrPtr = yyySSALCfreeList;  
          yyySSALCfreeList = SSALptrHead;  
         } 
     } 
   nextP = startP + 2;
   while (nextP < stopP) 
     {if (!(*nextP))
         {if ((*(nextP-2)) == yyyR)  
             {pL = &(yyyStackTop->solvedSAlist); 
              if (yyySSALCfreeList == yyyLambdaSSAL) 
                 {yyySSALspace[yyyNewSSALC].next = *pL; 
                  if ((*pL = yyyNewSSALC++) == yyySSALspaceSize) 
                     yyyHandleOverflow(yyySSALof); 
                 }  
                 else
                 {iTemp = yyySSALCfreeList; 
                  yyySSALCfreeList = yyySSALspace[yyySSALCfreeList].next; 
                  yyySSALspace[iTemp].next = *pL; 
                  *pL = iTemp;  
                 } 
              yyySSALspace[*pL].attrbNum = *(nextP-1); 
             } 
             else 
             {if ((gnpDum = (yyySTN->cL)[*(nextP-2)])->prodNum != 0)
                 {
                  iTemp = yyyIIEL[yyyIIIEL[gnpDum->prodNum]] + *(nextP-1);
                  yyySignalEnts(gnpDum, 
                                yyyEntL + yyyIEL[iTemp],  
                                yyyEntL + yyyIEL[iTemp+1] 
                               );    
                 }  
             } 
         } 
      nextP += 3; 
     } 
   yyyStackTop->node = yyySTN;
   if (!yyyRHSlength) yyyStackTop->oldestNode = yyySTN; 
   if (!--intNodeCount) 
      {intNodeCount = yyyDECORfREQ; 
       yyyDecorate(); 
      } 
  } 



void yyyPrune(prodNum) 
  long prodNum;
  {  
   int i,n; 
   register char *cp1,*cp2;  
   register yyyRCT *rcp1,*rcp2,*rcp3;  
   long cycleSum = 0;
   long nNZrc = 0;
   yyyRCT *tempNextRCLspace;
   
   yyyDecorate();
   tempNextRCLspace = yyyNextRCLspace;
   yyyNextRCLspace = 
     (rcp1 = rcp2 = (yyyStackTop->oldestNode)->refCountList) + yyyNattrbs;
   rcp3 = (yyyStackTop->node)->refCountList; 
   while (rcp2 < rcp3) 
     if (*rcp2++) {cycleSum += *(rcp2 - 1); nNZrc++;} 
   if (nNZrc) 
      {
       fprintf(stderr,"\n\n\n----------\n");
       fprintf(stderr,
         "cycle detected during pruning of a subtree\n");
       fprintf(stderr,
         "  at whose root production %d is applied.\n",prodNum);
       yyyNextRCLspace = tempNextRCLspace; 
       fprintf(stderr,
         "prune aborted: searching subtree for %d unsolved instances:\n",
               nNZrc
              );
       yyyUnsolvedInstSearchTrav(yyyStackTop->node);
       return; 
      }
   for (i=0;i<yyyNattrbs;i++) rcp1[i] = rcp3[i]; 
   yyyNextCLspace = (yyyStackTop->oldestNode)->cL; 
   yyyNextNodeSpace = (char *)(yyyStackTop->oldestNode) + 
                      (n = yyyNdPrSz[yyyTypeNum]);
   cp1 = (char *)yyyStackTop->oldestNode; 
   cp2 = (char *)yyyStackTop->node; 
   for (i=0;i<n;i++) *cp1++ = *cp2++; 
   yyyStackTop->node = yyyStackTop->oldestNode; 
   (yyyStackTop->node)->refCountList = rcp1; 
   (yyyStackTop->node)->cL = yyyNextCLspace; 
  } 



void yyyGenLeaf(nAttrbs,typeNum,startP,stopP) 
  int nAttrbs,typeNum; 
  yyyWAT *startP,*stopP; 
  {
   if  (!(yyyTermBuffer.isEmpty)) yyyShift(); 
   yyyTermBuffer.isEmpty = 0;
   yyyTermBuffer.typeNum = typeNum; 
   yyyTermBuffer.nAttrbs = nAttrbs; 
   yyyTermBuffer.startP = startP; 
   yyyTermBuffer.stopP = stopP; 
   
  } 



void yyyerror()
  {yyyYok = 0; 
  } 



/* read the command line for changes in sizes of 
                  the evaluator's data structures */
void yyyCheckForResizes(argc,argv) 
  int argc; 
  char *argv[]; 
  {int i; 
   long dum; 
 
   if (!yyyPermitUserAlloc) return; 
   for (i=1;i<argc;i++) 
     { 
      if ((argv[i][0] != '-') || (argv[i][1] != 'Y')) continue; 
      if (strlen(argv[i]) < 4) goto yyyErrO1; 
      if (sscanf(argv[i]+3,"%d",&dum) != 1) goto yyyErrO1;
      if (dum < 2) dum = 2;
      switch (argv[i][2]) 
        {case yyyNSof:   yyyMaxNbytesNodeStg = dum; break; 
         case yyyRCof:   yyyMaxNrefCounts    = dum; break; 
         case yyyCLof:   yyyMaxNchildren     = dum; break; 
         case yyySof:    yyyMaxStackSize     = dum; break; 
         case yyySSALof: yyySSALspaceSize    = dum; break; 
         case yyyRSof:   yyyRSmaxSize        = dum; break; 
         case yyyTSof:   yyyTravStackMaxSize = dum; break; 
         default : goto yyyErrO1; 
        }
      continue;  
   yyyErrO1 : fprintf(stderr,"invalid command line option: %s\n",
                             argv[i] 
                     ); 
     } 
  } 
   
   
   


#define yyyLastProdNum 70


#define yyyNsorts 4


int yyyProdsInd[] = {
   0,
   0,   2,   5,   6,   9,  12,  18,  21,  22,  29,
  35,  38,  40,  44,  47,  55,  62,  69,  75,  79,
  82,  85,  87,  92,  99, 107, 109, 111, 114, 116,
 120, 123, 127, 131, 132, 135, 141, 149, 155, 162,
 166, 168, 170, 173, 176, 179, 182, 186, 189, 192,
 194, 198, 201, 205, 208, 212, 215, 217, 219, 221,
 225, 227, 229, 232, 234, 240, 247, 249, 252, 255,
 259,
};


int yyyProds[][2] = {
{ 334,   0},{1003,   2},{1003,   2},{ 323,   3},{1003,   2},
{1003,   2},{ 323,   3},{ 257,   3},{ 548,   0},{ 323,   3},
{ 703,   0},{ 548,   0},{ 257,   3},{  34,   0},{ 619,   1},
{ 540,   0},{ 856,   3},{ 124,   0},{ 856,   3},{  83,   3},
{ 856,   3},{ 856,   3},{  83,   3},{ 619,   1},{ 396,   0},
{ 858,   4},{ 404,   0},{ 540,   0},{ 852,   4},{  83,   3},
{ 619,   1},{ 396,   0},{ 404,   0},{ 540,   0},{ 852,   4},
{ 858,   4},{1049,   4},{ 852,   4},{ 858,   4},{ 852,   4},
{1049,   4},{1049,   4},{ 852,   4},{ 428,   0},{1049,   4},
{ 852,   4},{ 428,   0},{ 703,   0},{ 479,   0},{ 619,   1},
{1010,   0},{ 947,   0},{ 540,   0},{ 884,   0},{ 124,   0},
{ 703,   0},{ 479,   0},{ 619,   1},{1010,   0},{ 540,   0},
{ 884,   0},{ 124,   0},{ 703,   0},{ 479,   0},{ 619,   1},
{1010,   0},{ 947,   0},{ 540,   0},{ 124,   0},{ 703,   0},
{ 479,   0},{ 619,   1},{1010,   0},{ 540,   0},{ 124,   0},
{ 884,   0},{ 884,   0},{ 811,   0},{ 548,   0},{ 884,   0},
{ 811,   0},{ 548,   0},{ 947,   0},{ 947,   0},{ 619,   1},
{ 947,   0},{ 619,   1},{ 811,   0},{ 933,   0},{ 619,   1},
{ 540,   0},{ 852,   4},{ 811,   0},{1119,   0},{ 619,   1},
{ 396,   0},{ 404,   0},{  63,   0},{ 124,   0},{ 811,   0},
{1119,   0},{ 619,   1},{ 396,   0},{ 114,   0},{ 404,   0},
{  63,   0},{ 124,   0},{ 852,   4},{1152,   0},{ 852,   4},
{ 619,   1},{ 114,   0},{ 853,   0},{ 769,   0},{ 114,   0},
{ 769,   0},{ 853,   0},{ 853,   0},{ 769,   0},{ 428,   0},
{ 853,   0},{ 769,   0},{ 428,   0},{ 769,   0},{ 619,   1},
{ 540,   0},{ 852,   4},{  63,   0},{ 246,   0},{ 548,   0},
{  63,   0},{  63,   0},{ 246,   0},{ 838,   0},{ 430,   0},
{ 246,   0},{ 635,   0},{ 430,   0},{ 361,   0},{  63,   0},
{ 124,   0},{ 246,   0},{ 635,   0},{ 430,   0},{ 361,   0},
{  63,   0},{ 815,   0},{  63,   0},{ 124,   0},{ 246,   0},
{ 911,   0},{ 430,   0},{ 702,   0},{  63,   0},{ 124,   0},
{ 246,   0},{ 933,   0},{ 619,   1},{ 540,   0},{ 852,   4},
{ 758,   0},{ 430,   0},{ 246,   0},{ 619,   1},{ 758,   0},
{ 430,   0},{ 246,   0},{ 430,   0},{ 430,   0},{ 997,   0},
{ 430,   0},{1229,   0},{ 997,   0},{ 430,   0},{ 997,   0},
{1092,   0},{ 430,   0},{ 997,   0},{1091,   0},{ 430,   0},
{ 997,   0},{1093,   0},{ 430,   0},{ 997,   0},{ 855,   0},
{ 997,   0},{ 430,   0},{  46,   0},{ 619,   1},{1229,   0},
{1165,   0},{1229,   0},{1229,   0},{1165,   0},{1092,   0},
{ 420,   0},{ 997,   0},{1092,   0},{1092,   0},{ 420,   0},
{ 997,   0},{1091,   0},{ 412,   0},{ 997,   0},{1091,   0},
{1091,   0},{ 412,   0},{ 997,   0},{1093,   0},{ 120,   0},
{ 997,   0},{1093,   0},{1093,   0},{ 120,   0},{ 997,   0},
{ 855,   0},{ 436,   0},{ 855,   0},{ 556,   0},{ 855,   0},
{ 564,   0},{ 997,   0},{ 396,   0},{ 430,   0},{ 404,   0},
{ 997,   0},{ 765,   0},{ 997,   0},{ 267,   0},{ 997,   0},
{ 749,   0},{ 619,   1},{ 997,   0},{ 619,   1},{ 997,   0},
{ 997,   0},{ 444,   0},{ 619,   1},{ 396,   0},{ 404,   0},
{ 997,   0},{ 997,   0},{ 444,   0},{ 619,   1},{ 396,   0},
{ 263,   0},{ 404,   0},{ 263,   0},{ 430,   0},{ 263,   0},
{ 859,   0},{ 430,   0},{ 859,   0},{ 430,   0},{ 428,   0},
{ 859,   0},{ 859,   0},{ 430,   0},{ 428,   0},
};


int yyySortsInd[] = {
  0,
  0,  2,  3,  5,
  6,
};


int yyySorts[] = {
  381,  177,  987,  987, 1088,  987,
};



char *yyyStringTab[] = {
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"isVisible",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"INTERFACE",
0,0,0,0,0,
0,0,0,0,0,
0,"NEW",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"Stats",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"AbstraktMethod",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"Pars",
0,0,0,0,0,
"AND",0,"y",0,"END",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"lineNr",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"METH",0,0,0,0,
0,"Stat",0,0,0,
0,0,0,0,0,
0,0,"Interface",0,0,
0,0,0,"ParamsExpr",0,
0,0,"THIS",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"ProgrammStart",0,
0,0,0,0,0,
0,0,0,0,"Start",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"THEN",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"name",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"'('",0,0,0,
0,0,0,0,"')'",
0,0,0,0,0,
0,0,"'*'",0,0,
0,"strdup",0,0,0,
"'+'",0,0,0,0,
0,0,0,"','",0,
"Expr",0,0,0,0,
0,"'-'",0,0,0,
0,0,"node_t",0,"'.'",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"CLASS",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"yylineno",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"':'",0,0,0,0,
0,0,0,"';'",0,
0,0,0,0,0,
0,"'<'",0,0,0,
0,0,0,0,"'='",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"ID",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"IF",0,0,0,0,
0,0,0,0,0,
"visCheck",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"DO","Class",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"NULL_VAL",
0,0,0,0,0,
"newList",0,0,"ASSIGNOP",0,
0,0,0,0,0,
"NUM",0,0,0,"Par",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"Member",0,0,0,
"ELSE",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"RETURN",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"Type","ParsLoop",0,
"SpecialOperation","AbstraktMethodsLoop",0,"ParamTypesLoop","ParamsExprLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ids",0,"MemeberLoop",
0,0,0,0,"ABSTRACT",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"WHILE",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"VAR",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ImplementsLoop",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"in",0,0,
0,0,0,0,0,
0,0,"Term",0,0,
0,0,0,"Programm",0,
0,0,0,0,0,
"IMPLEMENTS",0,0,0,0,
0,0,0,0,0,
0,0,0,"yytext",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"TypesLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"out",0,
0,"OptionalMalTerm","OptionalPlusTerm","OptionalAndTerm",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"METHOD",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"add",0,0,0,0,
0,0,"INT",0,0,
0,0,0,0,0,
0,0,0,0,0,
"NOT",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"OptionaNot",
0,
};



#define yyySizeofProd(num) (yyyProdsInd[(num)+1] - yyyProdsInd[(num)])

#define yyyGSoccurStr(prodNum,symPos) \
   (yyyStringTab[yyyProds[yyyProdsInd[(prodNum)] + (symPos)][0]])

#define yyySizeofSort(num) (yyySortsInd[(num)+1] - yyySortsInd[(num)])

#define yyySortOf(prodNum,symPos) \
  (yyyProds[yyyProdsInd[(prodNum)] + (symPos)][1]) 

#define yyyAttrbStr(prodNum,symPos,attrbNum)                      \
  (yyyStringTab[yyySorts[yyySortsInd[yyySortOf(prodNum,symPos)] + \
                         (attrbNum)                               \
                        ]                                         \
               ]                                                  \
  )



void yyyShowProd(i)
  int i;
  {int j,nSyms;

   nSyms = yyySizeofProd(i);
   for (j=0; j<nSyms; j++)
     {
      fprintf(stderr,"%s",yyyGSoccurStr(i,j));
      if (j == 0) fprintf(stderr," : "); else fprintf(stderr," ");
     }
   fprintf(stderr,";\n");
  }



void yyyShowProds()
  {int i; for (i=1; i<=yyyLastProdNum; i++) yyyShowProd(i);}



void yyyShowSymsAndSorts()
  {int i; 

   for (i=1; i<=yyyLastProdNum; i++) 
     {int j, nSyms;

      fprintf(stderr,
              "\n\n\n---------------------------------- %3.1d\n",i);
      /* yyyShowProd(i); */ 
      nSyms = yyySizeofProd(i); 
      for (j=0; j<nSyms; j++) 
        {int k, sortSize;

         fprintf(stderr,"%s\n",yyyGSoccurStr(i,j));
         sortSize = yyySizeofSort(yyySortOf(i,j));
         for (k=0; k<sortSize; k++) 
            fprintf(stderr,"  %s\n",yyyAttrbStr(i,j,k));
         if (j == 0) fprintf(stderr,"->\n"); 
              else 
              fprintf(stderr,"\n"); 
        }
     }
  }



void yyyCheckNodeInstancesSolved(np)
  yyyGNT *np;
  {int mysort,sortSize,i,prodNum,symPos,inTerminalNode;
   int nUnsolvedInsts = 0;

   if (np->prodNum != 0)
     {inTerminalNode = 0;
      prodNum = np->prodNum;
      symPos = 0;
     }
   else
     {inTerminalNode = 1;
      prodNum = ((yyyGNT *)(np->parent))->prodNum;
      symPos = np->whichSym;
     }
   mysort = yyySortOf(prodNum,symPos);
   sortSize = yyySizeofSort(mysort);
   for (i=0; i<sortSize; i++)
     if ((np->refCountList)[i] != 0) nUnsolvedInsts += 1;
   if (nUnsolvedInsts)
     {fprintf(stderr,
      "\nFound node that has %d unsolved attribute instance(s).\n",
              nUnsolvedInsts
             );
      fprintf(stderr,"Node is labeled \"%s\".\n",
             yyyGSoccurStr(prodNum,symPos));
      if (inTerminalNode)
        {fprintf(stderr,
                 "Node is terminal.  Its parent production is:\n  ");
         yyyShowProd(prodNum);
        }
      else
        {fprintf(stderr,"Node is nonterminal.  ");
         if (((char *)(np->parent)) >= yyyNodeSpace)
           {fprintf(stderr,
                    "Node is %dth child in its parent production:\n  ",
                   np->whichSym
                  );
            yyyShowProd(((yyyGNT *)(np->parent))->prodNum);
           }
         fprintf(stderr,
                 "Node is on left hand side of this production:\n  ");
         yyyShowProd(np->prodNum);
        }
      fprintf(stderr,"The following instances are unsolved:\n");
      for (i=0; i<sortSize; i++)
        if ((np->refCountList)[i] != 0)
          fprintf(stderr,"     %-16s still has %1d dependencies.\n",
                  yyyAttrbStr(prodNum,symPos,i),(np->refCountList)[i]);
     }
  }



void yyyUnsolvedInstSearchTravAux(pNode)
  yyyGNT *pNode;
  {yyyGNT **yyyCLpdum;
   int i;
  
   yyyCheckNodeInstancesSolved(pNode); 
   yyyCLpdum = pNode->cL;
   while
     ((yyyCLpdum != yyyNextCLspace) && ((*yyyCLpdum)->parent == pNode))
     {
      yyyUnsolvedInstSearchTravAux(*yyyCLpdum);
      yyyCLpdum++;
     }
  }



void yyyUnsolvedInstSearchTrav(pNode)
  yyyGNT *pNode;
  {yyyGNT **yyyCLpdum;
   int i;
  
   yyyCLpdum = pNode->cL;
   while
     ((yyyCLpdum != yyyNextCLspace) && ((*yyyCLpdum)->parent == pNode))
     {
      yyyUnsolvedInstSearchTravAux(*yyyCLpdum);
      yyyCLpdum++;
     }
  }




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
#include "tree.h"

#include "code_injection.h"

#include "code_generator.h"

#include "class_var_list.h"

#include "implemented_meth_list.h"

void yyerror(char const*);

extern int yylex();

extern void burm_reduce(NODEPTR_TYPE, int);
extern void burm_label(NODEPTR_TYPE);

long newIdCounter = 0;

char* lastIfLabelName = "label";
long varCounter = 0;

char* prepareLabelString(char* classname, char* functionname, long counter)
{
    char *ifName = calloc(strlen(lastIfLabelName) + strlen(classname) + strlen(functionname) + 25 + counter, sizeof(char));
    sprintf(ifName, "%s_%s_%s_%d", lastIfLabelName, classname, functionname, counter);
    return ifName;
}

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


struct yyyT1 { long value; }; 
typedef struct yyyT1 *yyyP1; 


struct yyyT2 { char *name; int lineNr; }; 
typedef struct yyyT2 *yyyP2; 


struct yyyT3 { node_t* in; node_t* out; meth_node_t* inImplList; meth_node_t* outImplList; classvar_node_t* inClassVarList; classvar_node_t* outClassVarList; }; 
typedef struct yyyT3 *yyyP3; 


struct yyyT4 { node_t* in; node_t* out; }; 
typedef struct yyyT4 *yyyP4; 


struct yyyT5 { node_t* in; }; 
typedef struct yyyT5 *yyyP5; 


struct yyyT6 { node_t* ids; tree_t *tree; long paramsRegIdIn; long paramsRegIdOut; }; 
typedef struct yyyT6 *yyyP6; 


struct yyyT7 { node_t* in; char* currentClassName; char* currentFunctionName; long ifcounter; }; 
typedef struct yyyT7 *yyyP7; 


struct yyyT8 { node_t* in; node_t* out; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; code_injection_t* injection; }; 
typedef struct yyyT8 *yyyP8; 


struct yyyT9 { node_t* in; node_t* out; tree_t* tree; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; code_injection_t* outInjection; }; 
typedef struct yyyT9 *yyyP9; 


struct yyyT10 { node_t* in; node_t* out; char* currentClassName; meth_node_t* inImplList; meth_node_t* outImplList; classvar_node_t* inClassVarList; classvar_node_t* outClassVarList; }; 
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
 (((yyyP3)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->in) = newList();
                             (((yyyP3)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->inImplList) = newImplList();
                             (((yyyP3)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->inClassVarList) = newClarrVarList();
                            yyyAdjustINRC(yyyRCIL+0,yyyRCIL+9);/*yyyPrune(1);*/}}
                        ;

Programm                :   ProgrammStart Programm
                        {if(yyyYok){
yyyRSU(2,2,6,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+9,yyyRCIL+36);}}
                        |
                        {if(yyyYok){
yyyRSU(3,0,6,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+36,yyyRCIL+45);}}
                        ;

ProgrammStart           :   Interface ';'
                            {if(yyyYok){
yyyRSU(4,2,6,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+45,yyyRCIL+57);}}
                        |   Class ';'
                        {if(yyyYok){
yyyRSU(5,2,6,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+57,yyyRCIL+75);}}
                        ;

Interface               :   INTERFACE ID ':'
                                AbstraktMethodsLoop
                            END
                        {if(yyyYok){
yyyRSU(6,5,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+75,yyyRCIL+81);}}
                        ;

AbstraktMethodsLoop     :   AbstraktMethod AbstraktMethodsLoop
                            {if(yyyYok){
yyyRSU(7,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+81,yyyRCIL+90);}}
                        |
                        {if(yyyYok){
yyyRSU(8,0,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+90,yyyRCIL+93);}}
                        ;

AbstraktMethod          :   ID '(' ParamTypesLoop ')' ':' Type
                        {if(yyyYok){
yyyRSU(9,6,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+93,yyyRCIL+102);}}
                        |   ID '(' ')' ':' Type
                        {if(yyyYok){
yyyRSU(10,5,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+102,yyyRCIL+108);}}
                        ;

ParamTypesLoop          :   TypesLoop Type 
                        {if(yyyYok){
yyyRSU(11,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+108,yyyRCIL+114);}}
                        |   Type
                        {if(yyyYok){
yyyRSU(12,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+114,yyyRCIL+117);}}
                        ;

TypesLoop               :   TypesLoop Type ','
                        {if(yyyYok){
yyyRSU(13,3,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+117,yyyRCIL+123);}}
                        |   Type ',' 
                        {if(yyyYok){
yyyRSU(14,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+123,yyyRCIL+126);}}
                        ;

Class                   :   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                                MemeberLoop
                            END
                        {if(yyyYok){
yyyRSU(15,7,6,3);
yyyGenIntNode();
 (((yyyP10)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->currentClassName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name) ;

                            yyyAdjustINRC(yyyRCIL+126,yyyRCIL+150);}}
                        |   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        {if(yyyYok){
yyyRSU(16,6,6,3);
yyyGenIntNode();
 (((yyyP10)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->currentClassName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name) ;

                            yyyAdjustINRC(yyyRCIL+150,yyyRCIL+171);}}
                        |   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        {if(yyyYok){
yyyRSU(17,6,6,3);
yyyGenIntNode();
 (((yyyP3)yyySTsn)->outImplList) = (((yyyP3)yyySTsn)->outImplList) ;
                            
                            yyyAdjustINRC(yyyRCIL+171,yyyRCIL+183);}}
                        |   CLASS ID
                            IMPLEMENTS ':'
                            END
                        {if(yyyYok){
yyyRSU(18,5,6,3);
yyyGenIntNode();
 (((yyyP3)yyySTsn)->outImplList) = (((yyyP3)yyySTsn)->outImplList) ;

                            yyyAdjustINRC(yyyRCIL+183,yyyRCIL+192);}}
                        ;

MemeberLoop             :   MemeberLoop Member ';' 
                        {if(yyyYok){
yyyRSU(19,3,7,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+192,yyyRCIL+225);}}
                        |   Member ';'
                        {if(yyyYok){
yyyRSU(20,2,7,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+225,yyyRCIL+246);}}
                        ;

ImplementsLoop          :   ImplementsLoop ID
                        {if(yyyYok){
yyyRSU(21,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+246,yyyRCIL+249);}}
                        |   ID
                        {if(yyyYok){
yyyRSU(22,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+249,yyyRCIL+249);/*yyyPrune(22);*/}}
                        ;

Member                  :   VAR ID ':' Type
                        {if(yyyYok){
yyyRSU(23,4,7,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+249,yyyRCIL+261);}}
                        |   METHOD ID '(' ')' StatsMethode END
                        {if(yyyYok){
yyyRSU(24,6,7,10);
yyyGenIntNode();
 (((yyyP7)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->ifcounter) = 0;

                             (((yyyP7)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->currentFunctionName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name);
                            yyyAdjustINRC(yyyRCIL+261,yyyRCIL+282);}}
                        |   METHOD ID '(' Pars ')' StatsMethode END
                        {if(yyyYok){
yyyRSU(25,7,7,10);
yyyGenIntNode();
 (((yyyP7)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->ifcounter) = 0;

                             (((yyyP7)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->currentFunctionName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name);
                            yyyAdjustINRC(yyyRCIL+282,yyyRCIL+306);}}
                        ;

Type                    :   INT
                        {if(yyyYok){
yyyRSU(26,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+306,yyyRCIL+306);/*yyyPrune(26);*/}}|   ID
                        {if(yyyYok){
yyyRSU(27,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+306,yyyRCIL+306);/*yyyPrune(27);*/}}
                        ;

Pars                    :   ParsLoop Par
                        {if(yyyYok){
yyyRSU(28,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+306,yyyRCIL+315);}}
                        |   Par
                        {if(yyyYok){
yyyRSU(29,1,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+315,yyyRCIL+321);}}
                        ;

ParsLoop                :   ParsLoop Par ','
                        {if(yyyYok){
yyyRSU(30,3,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+321,yyyRCIL+330);}}
                        |   Par ','
                        {if(yyyYok){
yyyRSU(31,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+330,yyyRCIL+336);}}
                        ;

Par                     :   ID ':' Type
                        {if(yyyYok){
yyyRSU(32,3,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+336,yyyRCIL+342);}}
                        ;

StatsMethode            :   Stats
                        {if(yyyYok){
yyyRSU(33,1,4,7);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->injection) = NULL;
                        yyyAdjustINRC(yyyRCIL+342,yyyRCIL+357);}}
                        ;

Stats                   :   Stat ';' Stats
                        {if(yyyYok){
yyyRSU(34,3,7,8);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[2]))+yyyGNSz))->injection) = NULL;

                            yyyAdjustINRC(yyyRCIL+357,yyyRCIL+390);}}
                        |
                        {if(yyyYok){
yyyRSU(35,0,7,8);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+390,yyyRCIL+396);}}
                        ;

Stat                    :   RETURN Expr
                        {if(yyyYok){
yyyRSU(36,2,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                            yyyAdjustINRC(yyyRCIL+396,yyyRCIL+411);}}
                        |   IF Expr THEN Stats END
                        {if(yyyYok){
yyyRSU(37,5,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                             (((yyyP8)(((char *)((yyySTN->cL)[3]))+yyyGNSz))->injection) = NULL;
                            
                            yyyAdjustINRC(yyyRCIL+411,yyyRCIL+441);}}
                        |   IF Expr THEN Stats ELSE Stats END
                        {if(yyyYok){
yyyRSU(38,7,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                            yyyAdjustINRC(yyyRCIL+441,yyyRCIL+486);}}
                        |   WHILE Expr DO Stats END
                        {if(yyyYok){
yyyRSU(39,5,8,9);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[3]))+yyyGNSz))->injection) = NULL;

                            yyyAdjustINRC(yyyRCIL+486,yyyRCIL+516);}}
                        |   VAR ID ':' Type ASSIGNOP Expr
                        {if(yyyYok){
yyyRSU(40,6,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                            yyyAdjustINRC(yyyRCIL+516,yyyRCIL+534);}}
                        |   ID ASSIGNOP Expr
                        {if(yyyYok){
yyyRSU(41,3,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                            yyyAdjustINRC(yyyRCIL+534,yyyRCIL+549);}}
                        |   Expr
                        {if(yyyYok){
yyyRSU(42,1,8,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->outInjection) = NULL;

                            yyyAdjustINRC(yyyRCIL+549,yyyRCIL+564);}}
                        ;

Expr                    :   OptionaNotTerm
                        {if(yyyYok){
yyyRSU(43,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+564,yyyRCIL+570);}}
                        |   Term OptionalPlusTerm
                        {if(yyyYok){
yyyRSU(44,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+570,yyyRCIL+579);}}
                        |   Term OptionalMalTerm
                        {if(yyyYok){
yyyRSU(45,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+579,yyyRCIL+588);}}
                        |   Term OptionalAndTerm
                        {if(yyyYok){
yyyRSU(46,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+588,yyyRCIL+597);}}
                        |   Term '-' Term
                        {if(yyyYok){
yyyRSU(47,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+597,yyyRCIL+606);}}
                        |   Term '<' Term
                        {if(yyyYok){
yyyRSU(48,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+606,yyyRCIL+615);}}
                        |   Term '=' Term
                        {if(yyyYok){
yyyRSU(49,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+615,yyyRCIL+624);}}
                        |   NEW ID
                        {if(yyyYok){
yyyRSU(50,2,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = createNewObjectLeaf((((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name));
                        yyyAdjustINRC(yyyRCIL+624,yyyRCIL+627);/*yyyPrune(50);*/}}
                        ;

OptionaNotTerm          :   Term
                        {if(yyyYok){
yyyRSU(51,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+627,yyyRCIL+633);}}
                        |   NOT OptionaNotTerm
                        {if(yyyYok){
yyyRSU(52,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+633,yyyRCIL+639);}}
                        ;

OptionalPlusTerm        :   '+' Term OptionalPlusTerm
                        {if(yyyYok){
yyyRSU(53,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+639,yyyRCIL+648);}}
                        |   '+' Term
                        {if(yyyYok){
yyyRSU(54,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+648,yyyRCIL+654);}}
                        ;

OptionalMalTerm         :   '*' Term OptionalMalTerm
                        {if(yyyYok){
yyyRSU(55,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+654,yyyRCIL+663);}}
                        |   '*' Term
                        {if(yyyYok){
yyyRSU(56,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+663,yyyRCIL+669);}}
                        ;

OptionalAndTerm         :   AND Term OptionalAndTerm
                        {if(yyyYok){
yyyRSU(57,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+669,yyyRCIL+678);}}
                        |   AND Term
                        {if(yyyYok){
yyyRSU(58,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+678,yyyRCIL+684);}}
                        ;

Term                    :   '(' Expr ')'
                        {if(yyyYok){
yyyRSU(59,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+684,yyyRCIL+690);}}
                        |   NUM
                        {if(yyyYok){
yyyRSU(60,1,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = createNumericalLeaf((((yyyP1)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->value)); 
                        yyyAdjustINRC(yyyRCIL+690,yyyRCIL+693);/*yyyPrune(60);*/}}
                        |   THIS
                        {if(yyyYok){
yyyRSU(61,1,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = createThisLeaf(); 
                        yyyAdjustINRC(yyyRCIL+693,yyyRCIL+696);/*yyyPrune(61);*/}}
                        |   NULL_VAL ID
                        {if(yyyYok){
yyyRSU(62,2,2,11);
yyyGenIntNode();
/* check what ??NULL ID` does */ (((yyyP11)yyySTsn)->tree) = createNULLLeaf();
                            yyyAdjustINRC(yyyRCIL+696,yyyRCIL+699);/*yyyPrune(62);*/}}
                        |   ID
                        {if(yyyYok){
yyyRSU(63,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+699,yyyRCIL+702);}}
                        |   Term '.' ID '(' ')'
                        {if(yyyYok){
yyyRSU(64,5,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+702,yyyRCIL+708);}}
                        |   Term '.' ID '(' ParamsExpr ')'
                        {if(yyyYok){
yyyRSU(65,6,2,11);
yyyGenIntNode();
 (((yyyP6)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->paramsRegIdIn) = 1;

                        yyyAdjustINRC(yyyRCIL+708,yyyRCIL+720);}}
                        ;

ParamsExpr              :   Expr
                        {if(yyyYok){
yyyRSU(66,1,4,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+720,yyyRCIL+729);}}
                        |   ParamsExprLoop Expr
                        {if(yyyYok){
yyyRSU(67,2,4,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+729,yyyRCIL+744);}}
                        ;

ParamsExprLoop          :   Expr ','
                        {if(yyyYok){
yyyRSU(68,2,4,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+744,yyyRCIL+753);}}
                        |   ParamsExprLoop Expr ',' 
                        {if(yyyYok){
yyyRSU(69,3,4,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+753,yyyRCIL+768);}}
                        ;


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
0,0,0, 0,2,0, 0,4,0, yyyR,1,1, yyyR,3,1, yyyR,5,1, 
0,0,1, 0,2,1, 0,4,1, 1,0,1, 1,2,1, 1,4,1, 
yyyR,1,1, yyyR,3,1, yyyR,5,1, yyyR,1,1, yyyR,3,1, yyyR,5,1, 
0,0,1, yyyR,1,1, yyyR,3,1, yyyR,5,1, 0,0,1, 0,2,1, 
0,4,1, yyyR,1,1, 3,0,1, yyyR,1,1, 0,0,1, 1,0,1, 
yyyR,1,1, yyyR,1,1, 2,0,1, 5,0,1, yyyR,1,1, 4,0,1, 
0,0,1, 1,0,1, 0,0,1, 0,0,1, 1,0,1, 0,0,1, 
yyyR,1,1, yyyR,3,1, yyyR,5,1, 3,0,1, 5,0,1, 5,2,0, 
5,3,1, 5,5,1, yyyR,1,1, yyyR,3,1, yyyR,5,1, 4,0,1, 
4,2,0, 4,3,1, 4,5,1, yyyR,1,1, yyyR,3,0, yyyR,5,1, 
3,0,1, yyyR,1,1, yyyR,3,0, yyyR,5,1, yyyR,1,1, yyyR,4,1, 
yyyR,6,1, 0,0,1, 0,2,1, 0,3,1, 0,5,1, 1,0,1, 
1,2,1, 1,3,1, 1,5,1, yyyR,1,1, yyyR,4,1, yyyR,6,1, 
0,0,1, 0,2,1, 0,3,1, 0,5,1, 0,0,1, yyyR,1,1, 
yyyR,4,1, yyyR,6,2, 3,0,1, yyyR,1,1, yyyR,4,2, yyyR,6,1, 
4,0,1, 4,1,1, 4,2,0, 4,3,0, yyyR,1,1, yyyR,4,2, 
yyyR,6,1, 3,0,1, 5,0,1, 5,1,1, 5,2,0, 5,3,0, 
yyyR,1,1, 0,0,1, 1,0,1, yyyR,1,1, 0,0,1, yyyR,1,1, 
0,0,1, 1,0,1, yyyR,1,1, 0,0,1, yyyR,1,1, 2,0,1, 
0,0,1, 0,2,1, 0,3,1, 0,4,1, 0,6,0, yyyR,1,1, 
yyyR,5,1, 0,0,1, 0,3,1, 0,4,1, 0,5,1, 2,0,1, 
2,2,1, 2,3,1, 2,4,1, 2,6,0, yyyR,1,1, yyyR,5,1, 
yyyR,1,1, yyyR,2,1, yyyR,6,1, yyyR,7,0, 1,0,1, yyyR,1,1, 
yyyR,2,4, yyyR,6,1, yyyR,7,0, 1,0,1, 3,0,1, 3,2,1, 
3,3,1, 3,4,1, 3,6,0, yyyR,1,1, yyyR,2,4, yyyR,6,1, 
yyyR,7,0, 1,0,1, 3,0,1, 3,2,1, 3,3,1, 3,4,1, 
3,6,3, 5,0,1, 5,2,1, 5,3,1, 5,4,1, 5,6,3, 
yyyR,1,1, yyyR,2,4, yyyR,6,1, yyyR,7,3, 1,0,1, 3,0,1, 
3,2,1, 3,3,1, 3,4,1, 3,6,0, yyyR,1,1, yyyR,2,2, 
yyyR,6,1, yyyR,7,0, 3,0,1, 5,0,1, yyyR,1,1, yyyR,2,2, 
yyyR,6,1, yyyR,7,0, 2,0,1, yyyR,1,1, yyyR,2,1, yyyR,6,1, 
yyyR,7,0, 0,0,1, yyyR,1,1, 0,0,1, yyyR,1,2, 0,0,1, 
1,0,1, yyyR,1,2, 0,0,1, 1,0,1, yyyR,1,2, 0,0,1, 
1,0,1, yyyR,1,2, 0,0,1, 2,0,1, yyyR,1,2, 0,0,1, 
2,0,1, yyyR,1,2, 0,0,1, 2,0,1, yyyR,1,0, yyyR,1,1, 
0,0,1, yyyR,1,1, 1,0,1, yyyR,1,2, 1,0,1, 2,0,1, 
yyyR,1,1, 1,0,1, yyyR,1,2, 1,0,1, 2,0,1, yyyR,1,1, 
1,0,1, yyyR,1,2, 1,0,1, 2,0,1, yyyR,1,1, 1,0,1, 
yyyR,1,1, 1,0,1, yyyR,1,0, yyyR,1,0, yyyR,1,0, yyyR,1,1, 
yyyR,1,1, 0,0,1, yyyR,1,3, 0,0,1, 4,0,1, 4,2,0, 
yyyR,1,2, yyyR,3,1, 0,0,1, yyyR,1,4, yyyR,3,1, 0,0,1, 
0,2,1, 1,0,1, yyyR,1,1, yyyR,3,1, 0,0,1, yyyR,1,4, 
yyyR,3,1, 0,0,1, 0,2,1, 1,0,1, 
};

short yyyIIIEL[] = {0,
0,2,5,6,9,12,18,21,22,29,
35,38,40,44,47,55,62,69,75,79,
82,85,87,92,99,107,109,111,114,116,
120,123,127,129,133,134,137,143,151,157,
164,168,170,172,175,178,181,185,189,193,
196,198,201,205,208,212,215,219,222,226,
228,230,233,235,241,248,250,253,256,
};

long yyyIIEL[] = {
0,0,6,12,18,24,30,36,38,38,44,50,
50,52,52,54,54,56,56,58,60,62,64,66,
68,68,69,69,69,70,72,74,74,74,74,75,
76,77,78,79,80,81,82,83,83,84,85,85,
91,91,93,93,94,94,101,101,107,107,109,109,
109,116,116,122,122,124,124,125,125,125,131,131,
133,133,133,133,140,147,154,154,161,168,168,169,
170,172,173,175,182,182,184,184,185,192,192,194,
194,194,198,198,205,205,207,207,209,209,213,213,
214,214,215,217,219,221,223,225,227,229,231,233,
233,235,237,237,239,241,241,242,246,253,260,268,
268,275,282,290,290,292,300,300,302,302,309,309,
317,317,319,319,326,326,333,333,341,341,343,343,
350,350,358,358,360,360,361,361,363,371,373,373,
375,383,385,387,389,391,393,395,397,399,401,403,
405,407,409,411,411,413,415,417,417,419,421,423,
423,425,427,427,429,431,433,435,435,437,439,439,
441,443,445,445,447,449,449,451,453,455,455,457,
459,459,461,463,465,465,467,469,469,471,471,473,
474,476,476,478,478,480,482,484,486,488,488,490,
490,490,492,494,494,496,496,500,500,504,506,510,
514,516,520,522,522,526,530,532,
};

long yyyIEL[] = {
0,0,0,0,0,0,0,2,
2,4,4,6,6,6,8,8,
10,10,12,12,14,14,16,16,
18,20,20,22,22,24,24,26,
26,28,28,30,30,30,32,34,
34,36,36,38,38,38,40,40,
42,42,44,46,46,48,50,50,
52,54,54,54,56,56,58,60,
60,66,66,68,70,70,70,74,
74,76,78,78,82,82,82,84,
84,88,88,88,90,90,96,96,
98,98,100,100,106,110,110,110,
110,110,110,112,112,114,118,118,
120,120,122,122,128,132,132,132,
132,132,134,134,136,140,140,140,
140,142,142,144,146,146,148,148,
148,148,150,150,152,154,156,156,
160,162,162,164,164,164,166,166,
166,168,168,170,170,172,172,172,
174,174,176,178,178,180,182,182,
184,184,184,186,186,186,188,188,
190,192,192,192,192,192,192,192,
196,196,198,200,200,202,202,206,
208,208,212,212,216,218,218,220,
220,224,224,224,224,224,224,228,
228,232,234,234,236,236,240,240,
240,242,242,242,242,242,242,242,
242,242,244,244,244,246,246,248,
250,250,250,252,254,254,254,256,
256,258,260,260,260,262,266,266,
268,270,270,272,274,276,278,278,
278,278,278,278,278,278,280,280,
284,288,290,290,290,290,292,292,
292,292,292,294,294,294,296,296,
296,296,298,298,300,300,300,300,
302,302,302,306,306,306,306,306,
308,308,308,308,310,316,316,316,
318,320,324,324,324,324,326,326,
326,328,330,330,332,332,340,340,
340,344,348,356,356,356,356,358,
358,358,364,370,370,372,372,372,
372,372,372,372,374,374,380,380,
380,382,384,390,390,390,390,392,
392,392,396,400,400,402,402,410,
410,410,410,410,412,412,412,416,
418,418,418,420,426,426,426,426,
426,428,428,428,430,430,430,432,
436,436,436,436,436,438,438,438,
438,440,442,442,442,444,448,448,
448,450,450,452,456,456,456,458,
458,460,464,464,464,466,466,468,
472,472,472,474,474,476,480,480,
480,482,482,484,488,488,488,490,
490,492,492,492,494,494,496,496,
496,498,500,500,500,502,506,506,
506,508,508,510,512,512,512,514,
518,518,518,520,520,522,524,524,
524,526,530,530,530,532,532,534,
536,536,536,538,540,540,540,542,
542,542,544,544,544,544,544,544,
544,546,546,548,548,550,550,550,
552,554,554,558,558,558,560,562,
562,562,564,564,566,568,568,572,
572,572,574,578,578,582,582,582,
584,584,588,588,590,592,592,594,
594,594,596,600,600,604,604,604,
606,606,610,610,612,
};

yyyFT yyyEntL[] = {
1,0,1,2,1,4,2,0,2,2,2,4,0,1,0,3,
0,5,0,1,0,3,0,5,1,0,0,3,0,5,0,1,
1,0,1,2,1,4,0,1,0,3,0,5,4,0,4,0,
4,0,0,1,1,0,2,0,0,1,0,1,0,1,6,0,
3,0,0,1,0,1,0,1,5,0,0,1,0,1,2,0,
1,0,1,0,2,0,1,0,1,0,0,1,4,0,6,0,
6,3,6,5,0,1,6,2,6,0,0,1,6,0,0,3,
0,5,0,1,5,0,5,3,5,5,0,1,5,2,5,0,
0,1,5,0,0,3,0,5,0,1,4,0,0,5,0,1,
0,1,0,1,0,5,0,1,0,1,1,0,2,2,1,2,
1,3,1,5,2,0,2,3,2,5,0,1,0,4,0,6,
1,0,1,2,1,3,1,5,0,1,0,4,0,6,1,0,
0,1,4,0,0,6,0,4,0,6,0,1,0,6,0,1,
0,1,5,0,0,4,5,1,0,4,0,6,0,4,5,2,
0,1,4,0,0,4,6,1,0,4,0,6,0,4,6,2,
6,0,1,0,2,0,0,1,1,0,0,1,1,0,2,0,
0,1,1,0,0,1,0,1,3,0,0,1,0,1,1,0,
1,2,1,3,1,4,1,0,3,2,1,3,3,3,1,4,
1,5,3,0,3,4,0,1,0,5,0,1,0,5,0,1,
2,0,0,6,0,2,0,1,4,0,2,0,4,2,4,3,
0,2,4,4,0,2,0,2,0,2,0,6,0,1,6,0,
4,0,2,0,6,2,4,2,6,3,4,3,0,2,6,6,
4,6,4,4,0,2,0,2,6,6,4,6,0,2,6,6,
4,6,6,4,0,6,0,1,4,0,2,0,4,2,4,3,
0,7,0,2,4,4,0,2,0,7,0,2,0,7,0,2,
0,6,0,1,0,2,4,0,6,0,0,6,0,1,0,2,
0,1,0,2,0,1,0,2,3,0,0,6,0,2,0,2,
0,1,1,0,0,6,0,2,1,0,0,1,2,0,1,0,
0,1,0,1,2,0,1,0,0,1,0,1,2,0,1,0,
0,1,0,1,3,0,1,0,0,1,0,1,3,0,1,0,
0,1,0,1,3,0,1,0,0,1,0,1,0,1,1,0,
0,1,2,0,0,1,3,0,2,0,0,1,0,1,2,0,
0,1,3,0,2,0,0,1,0,1,2,0,0,1,3,0,
2,0,0,1,0,1,2,0,0,1,2,0,0,1,0,1,
0,1,0,1,1,0,0,1,0,1,5,0,1,0,0,1,
0,1,0,1,0,1,1,0,0,1,0,3,0,1,2,0,
1,0,0,1,1,2,0,1,0,3,0,1,0,1,1,0,
0,3,0,1,2,0,1,0,0,1,1,2,0,1,0,3,
0,1,0,1,
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
int yyyNdSz[12];

int yyyNdPrSz[12];

typedef int yyyCopyType;

int yyyNdCopySz[12];
long yyyBiggestNodeSize = 0;

void yyyNodeSizeCalc()
  {int i;
   yyyGNSz = yyyCeiling(yyyGNSz,yyyAlignSize); 
   yyyNdSz[0] = 0;
   yyyNdSz[1] = sizeof(struct yyyT1);
   yyyNdSz[2] = sizeof(struct yyyT2);
   yyyNdSz[3] = sizeof(struct yyyT3);
   yyyNdSz[4] = sizeof(struct yyyT4);
   yyyNdSz[5] = sizeof(struct yyyT5);
   yyyNdSz[6] = sizeof(struct yyyT6);
   yyyNdSz[7] = sizeof(struct yyyT7);
   yyyNdSz[8] = sizeof(struct yyyT8);
   yyyNdSz[9] = sizeof(struct yyyT9);
   yyyNdSz[10] = sizeof(struct yyyT10);
   yyyNdSz[11] = sizeof(struct yyyT11);
   for (i=0;i<12;i++) 
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
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outImplList) ;

                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outClassVarList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    case 4:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;
                                break;
    case 4:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outClassVarList) ;
                                break;
    }
  break;
  }
break;
case 3:  /***yacc rule 3***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;

                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                            break;
    }
  break;
  }
break;
case 4:  /***yacc rule 4***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                    break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                
                                    break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                    break;
    }
  break;
  }
break;
case 5:  /***yacc rule 5***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;

                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outClassVarList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    case 4:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                                break;
    }
  break;
  }
break;
case 6:  /***yacc rule 6***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->out) ;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),INTERFACE_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Interface Id hinzufuegen");
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                                break;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"AbstrakteMethod methoden ID hinzufuegen (Mit params)");
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"AbstrakteMethod methoden ID hinzufuegen (ohne params)");
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 15:  /***yacc rule 15***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id");
                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->outImplList) ;

                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->outClassVarList) ;
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev(duplicate((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"CLass Id hinzufuegen f??r Member");
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    case 5:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                                break;
    }
  break;
  }
break;
case 16:  /***yacc rule 16***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id2");

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[4]))+yyyGNSz))->outImplList) ;


                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)((yyyRefN->cL)[4]))+yyyGNSz))->outClassVarList) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev(duplicate((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"CLass Id hinzufuegen f??r Member2");
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    case 5:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                                break;
    }
  break;
  }
break;
case 17:  /***yacc rule 17***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id3");
                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    }
  break;
  }
break;
case 18:  /***yacc rule 18***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id4");

                                break;
    case 5:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 19:  /***yacc rule 19***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outImplList) ;

                                break;
    case 6:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outClassVarList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList);
                                break;
    case 5:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inClassVarList);
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;

                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;
                                break;
    case 5:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outClassVarList) ;
                                break;
    }
  break;
  }
break;
case 20:  /***yacc rule 20***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;

                                break;
    case 6:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outClassVarList) ;

                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;

                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList);
                                break;
    case 5:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inClassVarList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inClassVarList);
                                break;
    }
  break;
  }
break;
case 21:  /***yacc rule 21***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 22:  /***yacc rule 22***/
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
case 23:  /***yacc rule 23***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_VAR,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Id von member hinzfuegen");
                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;

                                break;
    case 6:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = addClassVar((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) , (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name));
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ; 

                                break;
    }
  break;
  }
break;
case 24:  /***yacc rule 24***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = addImpl((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList), (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name));
                            
                                break;
    case 6:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;


                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 1:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    }
  break;
  }
break;
case 25:  /***yacc rule 25***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = duplicate((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in));
                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = addImpl((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList), (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name));

                                break;
    case 6:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outClassVarList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inClassVarList) ;

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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = duplicate((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in));
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->out) ;

                                break;
    case 1:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
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
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                            break;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  }
break;
case 29:  /***yacc rule 29***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                            break;
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
case 30:  /***yacc rule 30***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                            break;
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
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  }
break;
case 31:  /***yacc rule 31***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                            break;
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
case 32:  /***yacc rule 32***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),PARAMETER,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"Paramter id hinzufuegen");
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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                            break;
    }
  break;
  }
break;
case 33:  /***yacc rule 33***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->ifcounter);

                                break;
    }
  break;
  }
break;
case 34:  /***yacc rule 34***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP8)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->out);

                                break;
    case 5:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 3:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 4:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 5:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  }
break;
case 35:  /***yacc rule 35***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 5:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  }
break;
case 36:  /***yacc rule 36***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_RETURN, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), NULL);

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);
                            
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 37:  /***yacc rule 37***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_IF, createIfLabelLeaf(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn))), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree));
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                yyySignalEnts(yyyRefN,yyyEntL+326,yyyEntL+328);
    break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                yyySignalEnts(yyyRefN,yyyEntL+328,yyyEntL+330);
    break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    }
  break;
  }
break;
case 38:  /***yacc rule 38***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_IF_ELSE, createIfLabelLeaf(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn))), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree));
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                yyySignalEnts(yyyRefN,yyyEntL+358,yyyEntL+364);
    break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                yyySignalEnts(yyyRefN,yyyEntL+364,yyyEntL+370);
    break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    case 6:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->injection) = createEndJMP_injection(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn)));
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut) + 1;
                                break;
    case 6:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->injection) = createElseJMP_injection(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn)));

                                break;
    }
  break;
  }
break;
case 39:  /***yacc rule 39***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_LOOP, createLoopLabelLeaf(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn))), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree));
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut);

                                break;
    case 7:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->outInjection) = createLoopLabel_injection(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn)));
                            
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                yyySignalEnts(yyyRefN,yyyEntL+392,yyyEntL+396);
    break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                yyySignalEnts(yyyRefN,yyyEntL+396,yyyEntL+400);
    break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    }
  break;
  }
break;
case 40:  /***yacc rule 40***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev(duplicate((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),VARIABLE,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Var assignment in stat"); varCounter++;
                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ASSIGN, createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name), VARIABLE, -1, calcCurrentLocalVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in))), (((yyyP11)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->tree));

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

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
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 41:  /***yacc rule 41***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ASSIGN, createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name), getTypeOfName((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getParameterIndex((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getTypeOfName((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) == CLASS_VAR ? getClassVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) : getLocalVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name))), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree));

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

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
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 42:  /***yacc rule 42***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree); /*TODO change later check if this is really ok! */
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 43:  /***yacc rule 43***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree) ; 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 44:  /***yacc rule 44***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ADD, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 45:  /***yacc rule 45***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MUL, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 46:  /***yacc rule 46***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_AND, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 47:  /***yacc rule 47***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MINUS, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 48:  /***yacc rule 48***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_LESS, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 49:  /***yacc rule 49***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_EQUAL, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 50:  /***yacc rule 50***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 51:  /***yacc rule 51***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree) ; 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 52:  /***yacc rule 52***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_NOT, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), NULL); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 53:  /***yacc rule 53***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ADD, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 54:  /***yacc rule 54***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 55:  /***yacc rule 55***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MUL, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 56:  /***yacc rule 56***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 57:  /***yacc rule 57***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_AND, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 58:  /***yacc rule 58***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 59:  /***yacc rule 59***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ; 
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 60:  /***yacc rule 60***/
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
case 61:  /***yacc rule 61***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 62:  /***yacc rule 62***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 63:  /***yacc rule 63***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name), getTypeOfName((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getParameterIndex((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getTypeOfName((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) == CLASS_VAR ? getClassVarOffset((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) : getLocalVarOffset((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)));
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 64:  /***yacc rule 64***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_SIMPLE_FUNCTION_CALL, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, -1, -1));
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 65:  /***yacc rule 65***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createComplexFuncNode(OP_COMPLEX_FUNC,
                                (((yyyP6)(((char *)((yyyRefN->cL)[4]))+yyyGNSz))->tree),
                                createNode(OP_COMPLEX_FUN_LEFT, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, -1, -1)),
                                (((yyyP6)(((char *)((yyyRefN->cL)[4]))+yyyGNSz))->paramsRegIdOut)
                            );
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 66:  /***yacc rule 66***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createParamNode(OP_COMPLEX_FUN_PARAM,(((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree),createEmptyLeaf(),getParameterRegister((((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn)),"");
                                break;
    case 3:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdOut) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn);
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 67:  /***yacc rule 67***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createParamNode(OP_COMPLEX_FUN_PARAM, (((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), getParameterRegister((((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn)), getParameterRegister((((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->paramsRegIdOut) +1)); 
                            
                                break;
    case 3:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdOut) = (((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->paramsRegIdOut) +1;

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    case 2:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdIn) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn);
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 68:  /***yacc rule 68***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree);
                                break;
    case 3:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdOut) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn);
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 69:  /***yacc rule 69***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createParamNode(OP_COMPLEX_FUN_PARAM, (((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), getParameterRegister((((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn)), getParameterRegister((((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->paramsRegIdOut) + 1));  
                            
                                break;
    case 3:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdOut) = (((yyyP6)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->paramsRegIdOut) + 1;


                            
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    case 2:
 (((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->paramsRegIdIn) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->paramsRegIdIn);
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
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


for (yyyi=0; yyyi<6; yyyi++) {
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
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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

if (yyyCond(0) != yyyPass) { generateClassTable((((yyyP3)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->out),(((yyyP3)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outImplList), (((yyyP3)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outClassVarList));
                        }
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
			}

break;
case 2:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 3:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 4:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 5:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 6:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 7:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 8:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 9:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 10:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 11:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 12:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 13:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 14:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 15:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 16:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 17:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 18:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 19:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 20:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 21:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
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
			}

break;
case 22:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
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
			}

break;
case 23:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 24:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
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
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { generateMethodeLabel((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), varCounter);
                        }
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
			}

break;
case 25:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
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
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { generateMethodeLabel((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name),varCounter);
                        }
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
			}

break;
case 26:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 27:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
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
			}

break;
case 28:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 29:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 30:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 31:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 32:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 33:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 34:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { /* print2D(@Stat.tree@); */

                            }
				break;
					}
		break;
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
if ( (1)) yyySetCond(1)

if ( (1)) yyySetCond(3)

if ( (1)) yyySetCond(6)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { if((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outInjection) != NULL && (((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outInjection)->op == OP_LOOP_LABEL) { processInjection((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outInjection)); }

                            }
if (yyyCond(2) != yyyPass) { }
if (yyyCond(3) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_ELSE_LABEL) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }
                            }
if (yyyCond(4) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_END_JUMP) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }

                            }
if (yyyCond(5) != yyyPass) { }
if (yyyCond(6) != yyyPass) { if((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree) != NULL) { burm_label((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)); burm_reduce((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree), 1); } 
                        }
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
			}

break;
case 35:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_ELSE_LABEL) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }
                            }
if (yyyCond(2) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_END_JUMP) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }

                        }
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
			}

break;
case 36:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
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
			}

break;
case 37:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                            
                            }
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

if (yyyCond(0) != yyyPass) { writeIfEndLabel(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));

                        }
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
			}

break;
case 38:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;

                            }
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

if (yyyCond(0) != yyyPass) { writeIfEndLabel(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));

                        }
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
			}

break;
case 39:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;

                            }
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
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { /* writeLoopEntry(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@)); */
                            }
if (yyyCond(2) != yyyPass) { writeLoopJumpToStart(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));
                            }
if (yyyCond(3) != yyyPass) { writeIfEndLabel(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));

                        }
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
			}

break;
case 40:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[5]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                            
                        }
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
			}

break;
case 41:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisibleForZuweisungOrZugriff((((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
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
			}

break;
case 42:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
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
			}

break;
case 43:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor ;
                        }
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
			}

break;
case 44:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 45:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 46:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 47:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 48:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 49:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 50:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), CLASS_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
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
			}

break;
case 51:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor ;
                        }
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
			}

break;
case 52:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
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
			}

break;
case 53:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 54:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 55:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 56:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 57:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 58:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 59:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 60:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 61:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
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
			}

break;
case 62:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
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
			}

break;
case 63:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisibleForZuweisungOrZugriff((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
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
			}

break;
case 64:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor /* ich kanns durchschleifen */ ;
                        }
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
			}

break;
case 65:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)
yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor /* ich kanns durchschleifen */ ;
                            }
if (yyyCond(1) != yyyPass) { (((yyyP6)(((char *)((yyyTSTn->cL)[4]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor);
                            
                            
                            }
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
			}

break;
case 66:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;

                        
                            }
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
			}

break;
case 67:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP6)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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
			}

break;
case 68:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;

                            }
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
			}

break;
case 69:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP6)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP6)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
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



yyyWAT yyyLRCIL[3] = {0,1,0,
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
   
   
   


#define yyyLastProdNum 69


#define yyyNsorts 11


int yyyProdsInd[] = {
   0,
   0,   2,   5,   6,   9,  12,  18,  21,  22,  29,
  35,  38,  40,  44,  47,  55,  62,  69,  75,  79,
  82,  85,  87,  92,  99, 107, 109, 111, 114, 116,
 120, 123, 127, 129, 133, 134, 137, 143, 151, 157,
 164, 168, 170, 172, 175, 178, 181, 185, 189, 193,
 196, 198, 201, 205, 208, 212, 215, 219, 222, 226,
 228, 230, 233, 235, 241, 248, 250, 253, 256,
 260,
};


int yyyProds[][2] = {
{ 334,   0},{1003,   3},{1003,   3},{ 323,   3},{1003,   3},
{1003,   3},{ 323,   3},{ 257,   4},{ 548,   0},{ 323,   3},
{ 703,   3},{ 548,   0},{ 257,   4},{  34,   0},{ 619,   2},
{ 540,   0},{ 856,   4},{ 124,   0},{ 856,   4},{  83,   4},
{ 856,   4},{ 856,   4},{  83,   4},{ 619,   2},{ 396,   0},
{ 858,   5},{ 404,   0},{ 540,   0},{ 853,   5},{  83,   4},
{ 619,   2},{ 396,   0},{ 404,   0},{ 540,   0},{ 853,   5},
{ 858,   5},{1049,   5},{ 853,   5},{ 858,   5},{ 853,   5},
{1049,   5},{1049,   5},{ 853,   5},{ 428,   0},{1049,   5},
{ 853,   5},{ 428,   0},{ 703,   3},{ 479,   0},{ 619,   2},
{1010,   0},{ 947,   5},{ 540,   0},{ 884,  10},{ 124,   0},
{ 703,   3},{ 479,   0},{ 619,   2},{1010,   0},{ 540,   0},
{ 884,  10},{ 124,   0},{ 703,   3},{ 479,   0},{ 619,   2},
{1010,   0},{ 947,   5},{ 540,   0},{ 124,   0},{ 703,   3},
{ 479,   0},{ 619,   2},{1010,   0},{ 540,   0},{ 124,   0},
{ 884,  10},{ 884,  10},{ 811,  10},{ 548,   0},{ 884,  10},
{ 811,  10},{ 548,   0},{ 947,   5},{ 947,   5},{ 619,   2},
{ 947,   5},{ 619,   2},{ 811,  10},{ 933,   0},{ 619,   2},
{ 540,   0},{ 853,   5},{ 811,  10},{1119,   0},{ 619,   2},
{ 396,   0},{ 404,   0},{ 830,   7},{ 124,   0},{ 811,  10},
{1119,   0},{ 619,   2},{ 396,   0},{ 114,   4},{ 404,   0},
{ 830,   7},{ 124,   0},{ 853,   5},{1152,   0},{ 853,   5},
{ 619,   2},{ 114,   4},{ 852,   4},{ 769,   4},{ 114,   4},
{ 769,   4},{ 852,   4},{ 852,   4},{ 769,   4},{ 428,   0},
{ 852,   4},{ 769,   4},{ 428,   0},{ 769,   4},{ 619,   2},
{ 540,   0},{ 853,   5},{ 830,   7},{  63,   8},{  63,   8},
{ 246,   9},{ 548,   0},{  63,   8},{  63,   8},{ 246,   9},
{ 838,   0},{ 430,  11},{ 246,   9},{ 635,   0},{ 430,  11},
{ 361,   0},{  63,   8},{ 124,   0},{ 246,   9},{ 635,   0},
{ 430,  11},{ 361,   0},{  63,   8},{ 815,   0},{  63,   8},
{ 124,   0},{ 246,   9},{ 911,   0},{ 430,  11},{ 702,   0},
{  63,   8},{ 124,   0},{ 246,   9},{ 933,   0},{ 619,   2},
{ 540,   0},{ 853,   5},{ 758,   0},{ 430,  11},{ 246,   9},
{ 619,   2},{ 758,   0},{ 430,  11},{ 246,   9},{ 430,  11},
{ 430,  11},{1090,  11},{ 430,  11},{ 997,  11},{1092,  11},
{ 430,  11},{ 997,  11},{1091,  11},{ 430,  11},{ 997,  11},
{1093,  11},{ 430,  11},{ 997,  11},{ 436,   0},{ 997,  11},
{ 430,  11},{ 997,  11},{ 556,   0},{ 997,  11},{ 430,  11},
{ 997,  11},{ 564,   0},{ 997,  11},{ 430,  11},{  46,   0},
{ 619,   2},{1090,  11},{ 997,  11},{1090,  11},{1165,   0},
{1090,  11},{1092,  11},{ 420,   0},{ 997,  11},{1092,  11},
{1092,  11},{ 420,   0},{ 997,  11},{1091,  11},{ 412,   0},
{ 997,  11},{1091,  11},{1091,  11},{ 412,   0},{ 997,  11},
{1093,  11},{ 120,   0},{ 997,  11},{1093,  11},{1093,  11},
{ 120,   0},{ 997,  11},{ 997,  11},{ 396,   0},{ 430,  11},
{ 404,   0},{ 997,  11},{ 765,   1},{ 997,  11},{ 267,   0},
{ 997,  11},{ 749,   0},{ 619,   2},{ 997,  11},{ 619,   2},
{ 997,  11},{ 997,  11},{ 444,   0},{ 619,   2},{ 396,   0},
{ 404,   0},{ 997,  11},{ 997,  11},{ 444,   0},{ 619,   2},
{ 396,   0},{ 263,   6},{ 404,   0},{ 263,   6},{ 430,  11},
{ 263,   6},{ 859,   6},{ 430,  11},{ 859,   6},{ 430,  11},
{ 428,   0},{ 859,   6},{ 859,   6},{ 430,  11},{ 428,   0},
};


int yyySortsInd[] = {
  0,
  0,  1,  3,  9, 11, 12, 16, 20, 27, 35,
 42,
 44,
};


int yyySorts[] = {
  793,  381,  177,  987, 1088,  825,  888,  829,  892,  987,
 1088,  987,  882,  121, 1001,  525,  987,  542,  545,  850,
  987, 1088,  542,  545, 1032,  557,  854,  987, 1088,  121,
  542,  545, 1032,  557,  919,  987, 1088,  542,  825,  888,
  829,  892,  882,  121,
};



char *yyyStringTab[] = {
0,"getParameterIndex",0,0,0,
0,0,0,0,0,
0,"addClassVar",0,"isVisible",0,
0,0,0,0,0,
"createEndJMP","createElseJMP",0,0,0,
0,0,0,0,0,
0,0,0,0,"INTERFACE",
0,0,0,0,0,
"ADD",0,0,0,0,
0,"NEW",0,0,0,
0,"CALL",0,0,0,
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
"AND","tree","y",0,"END",
0,0,0,0,0,
0,"reg",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"strtoul",0,0,0,
0,0,0,0,0,
"LABEL",0,0,0,0,
0,0,"lineNr",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"NULL","reduce",0,
"ASSIGN",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"METH",0,0,0,0,
0,"Stat",0,0,0,
0,0,0,0,0,
0,0,"Interface","MINUS",0,
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
0,"meth_node_t",0,0,"writeLoopJumpToStart",
0,0,0,0,0,
0,0,0,0,0,
0,"name",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"'('",0,0,0,
0,0,0,0,"')'",
0,0,0,0,0,
0,0,"'*'",0,0,
"getTypeOfName","classvar_node_t","strdup",0,0,
"'+'",0,0,0,0,
"label",0,"duplicate","','",0,
"Expr","LESS",0,0,0,
0,"'-'",0,0,0,
0,"code_injection_t","node_t",0,"'.'",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"generateMethodeLabel",0,0,
0,0,"tree_t",0,0,
0,0,0,0,"CLASS",
0,0,0,0,0,
0,0,0,0,0,
0,0,"genMeth",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"yylineno",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"paramsRegIdOut","endLabel",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"':'",0,"currentClassName",0,0,
"currentFunctionName",0,0,"';'",0,
0,0,0,0,0,
0,"'<'","ifcounterOut",0,0,
0,0,"PARAMETER","createLoopLabel","'='",
0,0,0,"gen",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"writeIfEndLabel",0,0,
0,0,0,0,0,
0,"createThisLeaf","createNULLLeaf","createEmptyLeaf","createIfLabelLeaf",
0,"createLoopLabelLeaf","createNewObjectLeaf","createNumericalLeaf",0,
0,0,0,0,"createComplexIdentifierLeaf",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"ID",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"IF",0,0,0,0,
0,0,0,0,0,
"visCheck",0,0,0,0,
0,"FUNCTION","PARAM",0,0,
0,0,0,0,0,
0,0,"FUNC",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"MUL",0,"DO","Class",0,
"EQUAL",0,0,0,0,
0,0,0,0,0,
0,0,0,0,"isVisibleForZuweisungOrZugriff",
0,"OP",0,0,0,
0,0,0,0,0,
0,0,0,"LOOP",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"NULL_VAL",
0,0,0,0,0,
"newList",0,0,"ASSIGNOP","newImplList",
0,0,0,"newClarrVarList",0,
"NUM",0,0,0,"Par",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"value",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"Member",0,0,0,
"ELSE",0,0,0,0,
"DING","FUN",0,0,"varCounter",
"inImplList",0,0,"createNode","inClassVarList",
"StatsMethode",0,0,"createParamNode",0,
0,0,0,"RETURN","createComplexFuncNode",
0,0,0,0,0,
0,"getNextRegister","getFirstRegister",0,0,
"ifcounter","getParameterRegister","ParsLoop","Type","injection",
0,"AbstraktMethodsLoop","VARIABLE","ParamTypesLoop","ParamsExprLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ids",0,"MemeberLoop",
0,0,0,"outImplList","ABSTRACT",
0,0,"outClassVarList",0,0,
0,0,0,0,0,
"processInjection",0,0,0,0,
0,0,0,0,0,
0,"WHILE",0,0,0,
0,"SIMPLE",0,0,"outInjection",
0,0,0,"if",0,
0,0,0,0,0,
0,0,0,"VAR",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ImplementsLoop","calcCurrentLocalVarOffset",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"getClassVarOffset","getLocalVarOffset",0,0,
0,0,0,0,0,
0,"JUMP","in",0,0,
0,0,0,0,0,
0,0,"Term",0,0,
0,"paramsRegIdIn",0,"Programm",0,
0,0,0,0,"op",
"IMPLEMENTS",0,0,0,0,
0,0,0,0,0,
0,0,0,"yytext",0,
0,0,0,0,0,
0,0,"ifcounterIn",0,0,
0,0,0,0,0,
0,0,0,"COMPLEX",0,
"regStor",0,0,0,"TypesLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"addDev",
0,0,0,0,0,
0,0,0,"out",0,
"OptionaNotTerm","OptionalMalTerm","OptionalPlusTerm","OptionalAndTerm",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"METHOD",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"burm",
"generateClassTable",0,0,0,0,
0,0,0,"addImpl",0,
0,0,"INT",0,0,
0,0,0,0,0,
0,0,0,0,0,
"NOT",0,0,0,0,
0,0,0,"prepareLabelString",0,
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
"LEFT",0,0,0,0,
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




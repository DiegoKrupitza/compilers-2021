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
%start      Start

@autoinh ids
@autosyn tree

@attributes { long value; } NUM
@attributes { char *name; int lineNr; } ID
@attributes { node_t* in; node_t* out; meth_node_t* inImplList; meth_node_t* outImplList; classvar_node_t* inClassVarList; classvar_node_t* outClassVarList; } Programm ProgrammStart Class
@attributes { node_t* in; node_t* out; } Interface AbstraktMethodsLoop AbstraktMethod Pars Par ParsLoop
@attributes { node_t* in; } Type ParamTypesLoop TypesLoop ImplementsLoop
@attributes { node_t* ids; tree_t *tree; long paramsRegIdIn; long paramsRegIdOut; } ParamsExpr ParamsExprLoop


@attributes { node_t* in; char* currentClassName; char* currentFunctionName; long ifcounter; } StatsMethode
@attributes { node_t* in; node_t* out; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; code_injection_t* injection; } Stats
@attributes { node_t* in; node_t* out; tree_t* tree; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; code_injection_t* outInjection; } Stat

@attributes { node_t* in; node_t* out; char* currentClassName; meth_node_t* inImplList; meth_node_t* outImplList; classvar_node_t* inClassVarList; classvar_node_t* outClassVarList; } MemeberLoop Member


@attributes { node_t* ids; tree_t *tree; } Expr OptionaNotTerm OptionalPlusTerm OptionalMalTerm OptionalAndTerm Term 

@traversal @postorder visCheck
@traversal @preorder reg


@traversal @postorder gen

@traversal @postorder genMeth
@traversal @postorder burm
@traversal @postorder endLabel

%%

Start                   :   Programm
                        @{
                            @i @Programm.in@ = newList();
                            @i @Programm.inImplList@ = newImplList();
                            @i @Programm.inClassVarList@ = newClarrVarList();
                            @gen generateClassTable(@Programm.out@,@Programm.outImplList@, @Programm.outClassVarList@);
                        @}
                        ;

Programm                :   ProgrammStart Programm
                        @{
                            @i @ProgrammStart.in@ = @Programm.0.in@ ;
                            @i @Programm.1.in@ = @ProgrammStart.out@ ;
                            @i @Programm.0.out@ = @Programm.1.out@ ;

                            @i @ProgrammStart.inImplList@ = @Programm.0.inImplList@ ;
                            @i @Programm.1.inImplList@ = @ProgrammStart.outImplList@ ;
                            @i @Programm.0.outImplList@ = @Programm.1.outImplList@ ;

                            @i @ProgrammStart.inClassVarList@ = @Programm.0.inClassVarList@ ;
                            @i @Programm.1.inClassVarList@ = @ProgrammStart.outClassVarList@ ;
                            @i @Programm.0.outClassVarList@ = @Programm.1.outClassVarList@ ;
                        @}
                        |
                        @{
                            @i @Programm.out@ = @Programm.in@ ;
                            @i @Programm.outImplList@ = @Programm.inImplList@ ;

                            @i @Programm.outClassVarList@ = @Programm.inClassVarList@ ;
                        @}
                        ;

ProgrammStart           :   Interface ';'
                            @{
                                @i @Interface.in@ = @ProgrammStart.in@ ;
                                @i @ProgrammStart.out@ = @Interface.out@ ;
                                @i @ProgrammStart.outImplList@ = @ProgrammStart.inImplList@ ;
                                
                                @i @ProgrammStart.outClassVarList@ = @ProgrammStart.inClassVarList@ ;
                            @}
                        |   Class ';'
                        @{
                            @i @Class.in@ = @ProgrammStart.in@ ;
                            @i @ProgrammStart.out@ = @Class.out@ ;

                            @i @Class.inImplList@ = @ProgrammStart.inImplList@ ;
                            @i @ProgrammStart.outImplList@ = @Class.outImplList@ ;

                            @i @Class.inClassVarList@ = @ProgrammStart.inClassVarList@ ;
                            @i @ProgrammStart.outClassVarList@ = @Class.outClassVarList@ ;
                        @}
                        ;

Interface               :   INTERFACE ID ':'
                                AbstraktMethodsLoop
                            END
                        @{
                            @i @AbstraktMethodsLoop.in@ = addDev(@Interface.in@,@ID.name@,INTERFACE_DING,@ID.lineNr@,"Interface Id hinzufuegen");
                            @i @Interface.out@ = @AbstraktMethodsLoop.out@ ;
                        @}
                        ;

AbstraktMethodsLoop     :   AbstraktMethod AbstraktMethodsLoop
                            @{
                                @i @AbstraktMethod.in@ = @AbstraktMethodsLoop.0.in@ ;
                                @i @AbstraktMethodsLoop.1.in@ = @AbstraktMethod.out@ ;
                                @i @AbstraktMethodsLoop.0.out@ = @AbstraktMethodsLoop.1.out@ ;
                            @}
                        |
                        @{
                            @i @AbstraktMethodsLoop.out@ = @AbstraktMethodsLoop.in@ ;
                        @}
                        ;

AbstraktMethod          :   ID '(' ParamTypesLoop ')' ':' Type
                        @{
                            @i @AbstraktMethod.out@ = addDev(@AbstraktMethod.in@,@ID.name@,ABSTRACT_METH,@ID.lineNr@,"AbstrakteMethod methoden ID hinzufuegen (Mit params)");
                            @i @ParamTypesLoop.in@ = @AbstraktMethod.in@ ;
                            @i @Type.in@ = @AbstraktMethod.in@ ;
                        @}
                        |   ID '(' ')' ':' Type
                        @{
                            @i @AbstraktMethod.out@ = addDev(@AbstraktMethod.in@,@ID.name@,ABSTRACT_METH,@ID.lineNr@,"AbstrakteMethod methoden ID hinzufuegen (ohne params)");
                            @i @Type.in@ = @AbstraktMethod.in@ ;
                        @}
                        ;

ParamTypesLoop          :   TypesLoop Type 
                        @{
                            @i @TypesLoop.in@ = @ParamTypesLoop.in@ ;
                            @i @Type.in@ = @ParamTypesLoop.in@ ;
                        @}
                        |   Type
                        @{
                            @i @Type.in@ = @ParamTypesLoop.in@ ;   
                        @}
                        ;

TypesLoop               :   TypesLoop Type ','
                        @{
                            @i @TypesLoop.1.in@ = @TypesLoop.0.in@ ;
                            @i @Type.in@ = @TypesLoop.0.in@ ;   
                        @}
                        |   Type ',' 
                        @{
                            @i @Type.in@ = @TypesLoop.in@ ;   
                        @}
                        ;

Class                   :   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                                MemeberLoop
                            END
                        @{
                            @i @MemeberLoop.in@ = addDev(duplicate(@Class.in@),@ID.name@,CLASS_DING,@ID.lineNr@,"CLass Id hinzufuegen für Member");
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id");
                            @i @ImplementsLoop.in@ = @Class.in@;

                            @i @MemeberLoop.currentClassName@ = @ID.name@ ;

                            @i @MemeberLoop.inImplList@ = @Class.inImplList@ ;
                            @i @Class.outImplList@ = @MemeberLoop.outImplList@ ;

                            @i @MemeberLoop.inClassVarList@ = @Class.inClassVarList@ ;
                            @i @Class.outClassVarList@ = @MemeberLoop.outClassVarList@ ;
                        @}
                        |   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        @{
                            @i @MemeberLoop.in@ = addDev(duplicate(@Class.in@),@ID.name@,CLASS_DING,@ID.lineNr@,"CLass Id hinzufuegen für Member2");
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id2");

                            @i @MemeberLoop.currentClassName@ = @ID.name@ ;

                            @i @MemeberLoop.inImplList@ = @Class.inImplList@ ;
                            @i @Class.outImplList@ = @MemeberLoop.outImplList@ ;


                            @i @MemeberLoop.inClassVarList@ = @Class.inClassVarList@ ;
                            @i @Class.outClassVarList@ = @MemeberLoop.outClassVarList@ ;
                        @}
                        |   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        @{
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id3");
                            @i @ImplementsLoop.in@ = @Class.in@;

                            @i @Class.outImplList@ = @Class.outImplList@ ;
                            
                            @i @Class.outClassVarList@ = @Class.inClassVarList@ ;
                        @}
                        |   CLASS ID
                            IMPLEMENTS ':'
                            END
                        @{
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id4");

                            @i @Class.outImplList@ = @Class.outImplList@ ;

                            @i @Class.outClassVarList@ = @Class.inClassVarList@ ;
                        @}
                        ;

MemeberLoop             :   MemeberLoop Member ';' 
                        @{
                            @i @MemeberLoop.1.in@ = @MemeberLoop.0.in@ ;
                            @i @Member.in@ = @MemeberLoop.1.out@ ;
                            @i @MemeberLoop.0.out@ = @Member.out@;

                            @i @MemeberLoop.1.currentClassName@ = @MemeberLoop.0.currentClassName@ ;
                            @i @Member.currentClassName@ = @MemeberLoop.0.currentClassName@ ;

                            @i @MemeberLoop.1.inImplList@ = @MemeberLoop.0.inImplList@;
                            @i @Member.inImplList@ = @MemeberLoop.1.outImplList@ ;
                            @i @MemeberLoop.0.outImplList@ = @Member.outImplList@ ;

                            @i @MemeberLoop.1.inClassVarList@ = @MemeberLoop.0.inClassVarList@;
                            @i @Member.inClassVarList@ = @MemeberLoop.1.outClassVarList@ ;
                            @i @MemeberLoop.0.outClassVarList@ = @Member.outClassVarList@ ;
                        @}
                        |   Member ';'
                        @{
                            @i @Member.in@ = @MemeberLoop.in@ ; 
                            @i @MemeberLoop.out@ = @Member.out@;

                            @i @Member.currentClassName@ = @MemeberLoop.currentClassName@ ;

                            @i @Member.inImplList@ = @MemeberLoop.inImplList@;
                            @i @MemeberLoop.outImplList@ = @Member.outImplList@ ;

                            @i @Member.inClassVarList@ = @MemeberLoop.inClassVarList@;
                            @i @MemeberLoop.outClassVarList@ = @Member.outClassVarList@ ;

                        @}
                        ;

ImplementsLoop          :   ImplementsLoop ID
                        @{
                            @i @ImplementsLoop.1.in@ = @ImplementsLoop.0.in@ ;
                            @visCheck isVisible(@ImplementsLoop.0.in@,@ID.name@, INTERFACE_DING, @ID.lineNr@);
                        @}
                        |   ID
                        @{
                            @visCheck isVisible(@ImplementsLoop.in@,@ID.name@, INTERFACE_DING, @ID.lineNr@);
                        @}
                        ;

Member                  :   VAR ID ':' Type
                        @{
                            @i @Member.out@ = addDev(@Member.in@,@ID.name@,CLASS_VAR,@ID.lineNr@,"Id von member hinzfuegen");
                            @i @Type.in@ = @Member.in@ ; 

                            @i @Member.outImplList@ = @Member.inImplList@ ;

                            @i @Member.outClassVarList@ = addClassVar(@Member.inClassVarList@ , @Member.currentClassName@, @ID.name@);
                        @}
                        |   METHOD ID '(' ')' StatsMethode END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @StatsMethode.in@ = @Member.in@ ;
                            @i @Member.out@ = @Member.in@;

                            @i @Member.outClassVarList@ = @Member.inClassVarList@ ;


                            @i @Member.outImplList@ = addImpl(@Member.inImplList@, @Member.currentClassName@, @ID.name@);
                            
                            @i @StatsMethode.currentClassName@ = @Member.currentClassName@;
                            @i @StatsMethode.currentFunctionName@ = @ID.name@;
                            @i @StatsMethode.ifcounter@ = 0;

                            @burm @revorder(1) generateMethodeLabel(@Member.currentClassName@, @ID.name@, varCounter);
                        @}
                        |   METHOD ID '(' Pars ')' StatsMethode END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @Pars.in@ = duplicate(@Member.in@);
                            @i @Member.out@ = duplicate(@Member.in@);
                            @i @StatsMethode.in@ = @Pars.out@ ;

                            @i @Member.outClassVarList@ = @Member.inClassVarList@ ;

                            @i @Member.outImplList@ = addImpl(@Member.inImplList@, @Member.currentClassName@, @ID.name@);

                            @i @StatsMethode.currentClassName@ = @Member.currentClassName@;
                            @i @StatsMethode.currentFunctionName@ = @ID.name@;
                            @i @StatsMethode.ifcounter@ = 0;

                            @burm @revorder(1) generateMethodeLabel(@Member.currentClassName@, @ID.name@,varCounter);
                        @}
                        ;

Type                    :   INT
                        |   ID
                        @{
                            @visCheck isVisible(@Type.in@,@ID.name@, INTERFACE_DING, @ID.lineNr@);
                        @}
                        ;

Pars                    :   ParsLoop Par
                        @{
                            @i @ParsLoop.in@ = @Pars.in@ ;
                            @i @Par.in@ = @ParsLoop.out@ ;
                            @i @Pars.out@ = @Par.out@ ;
                        @}
                        |   Par
                        @{
                            @i @Par.in@ = @Pars.in@ ;
                            @i @Pars.out@ = @Par.out@ ;
                        @}
                        ;

ParsLoop                :   ParsLoop Par ','
                        @{
                            @i @ParsLoop.1.in@ = @ParsLoop.0.in@ ;
                            @i @Par.in@ = @ParsLoop.1.out@ ;
                            @i @ParsLoop.0.out@ = @Par.out@ ;
                        @}
                        |   Par ','
                        @{
                            @i @Par.in@ = @ParsLoop.in@ ;
                            @i @ParsLoop.out@ = @Par.out@ ;
                        @}
                        ;

Par                     :   ID ':' Type
                        @{
                            @i @Par.out@ = addDev(@Par.in@,@ID.name@,PARAMETER,@ID.lineNr@,"Paramter id hinzufuegen");
                            @i @Type.in@ = @Par.in@ ; 
                        @}
                        ;

StatsMethode            :   Stats
                        @{
                            @i @Stats.in@ = @StatsMethode.in@ ;

                            @i @Stats.currentClassName@ = @StatsMethode.currentClassName@;
                            @i @Stats.currentFunctionName@ = @StatsMethode.currentFunctionName@;
                            @i @Stats.ifcounterIn@ = @StatsMethode.ifcounter@;

                            @i @Stats.injection@ = NULL;
                        @}
                        ;

Stats                   :   Stat ';' Stats
                        @{
                            @i @Stat.in@ = @Stats.0.in@ ;
                            @i @Stats.1.in@ = @Stat.out@ ;
                            @i @Stats.0.out@ = @Stats.1.out@;

                            @i @Stat.currentClassName@ = @Stats.0.currentClassName@;
                            @i @Stat.currentFunctionName@ = @Stats.0.currentFunctionName@;
                            @i @Stat.ifcounterIn@ = @Stats.0.ifcounterIn@;

                            @i @Stats.1.currentClassName@ = @Stats.0.currentClassName@;
                            @i @Stats.1.currentFunctionName@ = @Stats.0.currentFunctionName@;
                            @i @Stats.1.ifcounterIn@ = @Stat.ifcounterOut@;

                            @i @Stats.0.ifcounterOut@ = @Stats.1.ifcounterOut@;

                            @i @Stats.1.injection@ = NULL;

                            @visCheck @revorder(1) /* print2D(@Stat.tree@); */

                            @burm @revorder(1) if(@Stat.outInjection@ != NULL && @Stat.outInjection@->op == OP_LOOP_LABEL) { processInjection(@Stat.outInjection@); }

                            @burm @revorder(1) if(@Stats.injection@ != NULL && @Stats.injection@->op == OP_ELSE_LABEL) { processInjection(@Stats.injection@); }
                            @burm if(@Stats.injection@ != NULL && @Stats.injection@->op == OP_END_JUMP) { processInjection(@Stats.injection@); }

                            @burm @revorder(1) if(@Stat.tree@ != NULL) { burm_label(@Stat.tree@); burm_reduce(@Stat.tree@, 1); } 
                        @}
                        |
                        @{
                            @i @Stats.out@ = @Stats.in@ ;
                            @i @Stats.ifcounterOut@ = @Stats.ifcounterIn@;

                            @burm @revorder(1) if(@Stats.injection@ != NULL && @Stats.injection@->op == OP_ELSE_LABEL) { processInjection(@Stats.injection@); }
                            @burm if(@Stats.injection@ != NULL && @Stats.injection@->op == OP_END_JUMP) { processInjection(@Stats.injection@); }

                        @}
                        ;

Stat                    :   RETURN Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                            @i @Stat.tree@ = createNode(OP_RETURN, @Expr.tree@, NULL);

                            @i @Stat.ifcounterOut@ = @Stat.ifcounterIn@;
                            
                            @i @Stat.outInjection@ = NULL;

                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;
                        @}
                        |   IF Expr THEN Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;

                            @i @Stat.outInjection@ = NULL;

                            @i @Stats.currentClassName@ = @Stat.currentClassName@;
                            @i @Stats.currentFunctionName@ = @Stat.currentFunctionName@;

                            @i @Stats.ifcounterIn@ = @Stat.ifcounterIn@ + 1;
                            @i @Stat.ifcounterOut@ = @Stats.ifcounterOut@;

                            @i @Stats.injection@ = NULL;
                            
                            @i @Stat.tree@ = createNode(OP_IF, createIfLabelLeaf(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@)), @Expr.tree@);
                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;
                            
                            @burm writeIfEndLabel(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));

                        @}
                        |   IF Expr THEN Stats ELSE Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ; 
                            @i @Stats.0.in@ = @Stat.in@ ;
                            @i @Stats.1.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;

                            @i @Stat.outInjection@ = NULL;

                            @i @Stats.0.currentClassName@ = @Stat.currentClassName@;
                            @i @Stats.0.currentFunctionName@ = @Stat.currentFunctionName@;

                            @i @Stats.1.currentClassName@ = @Stat.currentClassName@;
                            @i @Stats.1.currentFunctionName@ = @Stat.currentFunctionName@;

                            @i @Stats.0.ifcounterIn@ = @Stat.ifcounterIn@ + 1;
                            @i @Stats.1.ifcounterIn@ = @Stats.0.ifcounterOut@ + 1;
                            @i @Stat.ifcounterOut@ = @Stats.1.ifcounterOut@;

                            @i @Stats.0.injection@ = createEndJMP_injection(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));
                            @i @Stats.1.injection@ = createElseJMP_injection(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));

                            @i @Stat.tree@ = createNode(OP_IF_ELSE, createIfLabelLeaf(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@)), @Expr.tree@);
                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;

                            @burm writeIfEndLabel(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));

                        @}
                        |   WHILE Expr DO Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;

                            @i @Stats.currentClassName@ = @Stat.currentClassName@;
                            @i @Stats.currentFunctionName@ = @Stat.currentFunctionName@;

                            @i @Stats.ifcounterIn@ = @Stat.ifcounterIn@ + 1;
                            @i @Stat.ifcounterOut@ = @Stats.ifcounterOut@;

                            @i @Stats.injection@ = NULL;

                            @i @Stat.outInjection@ = createLoopLabel_injection(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));
                            
                            @i @Stat.tree@ = createNode(OP_LOOP, createLoopLabelLeaf(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@)), @Expr.tree@);
                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;

                            @burm @revorder(1) /* writeLoopEntry(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@)); */
                            @burm writeLoopJumpToStart(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));
                            @burm writeIfEndLabel(prepareLabelString(@Stats.currentClassName@,@Stats.currentFunctionName@,@Stat.ifcounterIn@));

                        @}
                        |   VAR ID ':' Type ASSIGNOP Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = addDev(duplicate(@Stat.in@),@ID.name@,VARIABLE,@ID.lineNr@,"Var assignment in stat"); varCounter++;
                            @i @Type.in@ = @Stat.in@ ;

                            @i @Stat.outInjection@ = NULL;

                            @i @Stat.ifcounterOut@ = @Stat.ifcounterIn@;

                            @i @Stat.tree@ = createNode(OP_ASSIGN, createComplexIdentifierLeaf(@ID.name@, VARIABLE, -1, calcCurrentLocalVarOffset(@Stat.in@)), @Expr.tree@);

                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;
                            
                        @}
                        |   ID ASSIGNOP Expr
                        @{
                            @visCheck isVisibleForZuweisungOrZugriff(@Stat.in@,@ID.name@,@ID.lineNr@);
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;

                            @i @Stat.outInjection@ = NULL;

                            @i @Stat.ifcounterOut@ = @Stat.ifcounterIn@;

                            @i @Stat.tree@ = createNode(OP_ASSIGN, createComplexIdentifierLeaf(@ID.name@, getTypeOfName(@Stat.in@, @ID.name@), getParameterIndex(@Stat.in@, @ID.name@), getTypeOfName(@Stat.in@, @ID.name@) == CLASS_VAR ? getClassVarOffset(@Stat.in@, @ID.name@) : getLocalVarOffset(@Stat.in@, @ID.name@)), @Expr.tree@);

                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;
                        @}
                        |   Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;

                            @i @Stat.outInjection@ = NULL;

                            @i @Stat.ifcounterOut@ = @Stat.ifcounterIn@;

                            @i @Stat.tree@ = @Expr.tree@; /*TODO change later check if this is really ok! */
                            @reg @Stat.tree@->regStor = getFirstRegister(); @Expr.tree@->regStor = @Stat.tree@->regStor;
                        @}
                        ;

Expr                    :   OptionaNotTerm
                        @{
                            @i @Expr.tree@ = @OptionaNotTerm.tree@ ; 
                            @reg @OptionaNotTerm.tree@->regStor = @Expr.tree@->regStor ;
                        @}
                        |   Term OptionalPlusTerm
                        @{
                            @i @Expr.tree@ = createNode(OP_ADD, @Term.tree@, @OptionalPlusTerm.tree@); 
                            @reg @Term.tree@->regStor = @Expr.tree@->regStor; @OptionalPlusTerm.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   Term OptionalMalTerm
                        @{
                            @i @Expr.tree@ = createNode(OP_MUL, @Term.tree@, @OptionalMalTerm.tree@); 
                            @reg @Term.tree@->regStor = @Expr.tree@->regStor; @OptionalMalTerm.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   Term OptionalAndTerm
                        @{
                            @i @Expr.tree@ = createNode(OP_AND, @Term.tree@, @OptionalAndTerm.tree@); 
                            @reg @Term.tree@->regStor = @Expr.tree@->regStor; @OptionalAndTerm.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   Term '-' Term
                        @{
                            @i @Expr.tree@ = createNode(OP_MINUS, @Term.0.tree@, @Term.1.tree@); 
                            @reg @Term.0.tree@->regStor = @Expr.tree@->regStor; @Term.1.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   Term '<' Term
                        @{
                            @i @Expr.tree@ = createNode(OP_LESS, @Term.0.tree@, @Term.1.tree@); 
                            @reg @Term.0.tree@->regStor = @Expr.tree@->regStor; @Term.1.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   Term '=' Term
                        @{
                            @i @Expr.tree@ = createNode(OP_EQUAL, @Term.0.tree@, @Term.1.tree@); 
                            @reg @Term.0.tree@->regStor = @Expr.tree@->regStor; @Term.1.tree@->regStor = getNextRegister(@Expr.tree@->regStor);
                        @}
                        |   NEW ID
                        @{
                            @visCheck isVisible(@Expr.ids@,@ID.name@, CLASS_DING, @ID.lineNr@);
                            @i @Expr.tree@ = createNewObjectLeaf(@ID.name@);
                        @}
                        ;

OptionaNotTerm          :   Term
                        @{
                            @i @OptionaNotTerm.tree@ = @Term.tree@ ; 
                            @reg @Term.tree@->regStor = @OptionaNotTerm.tree@->regStor ;
                        @}
                        |   NOT OptionaNotTerm
                        @{
                            @i @OptionaNotTerm.0.tree@ = createNode(OP_NOT, @OptionaNotTerm.1.tree@, NULL); 
                            @reg @OptionaNotTerm.1.tree@->regStor = @OptionaNotTerm.0.tree@->regStor;
                        @}
                        ;

OptionalPlusTerm        :   '+' Term OptionalPlusTerm
                        @{
                            @i @OptionalPlusTerm.0.tree@ = createNode(OP_ADD, @Term.tree@, @OptionalPlusTerm.1.tree@); 
                            @reg @Term.tree@->regStor = @OptionalPlusTerm.0.tree@->regStor; @OptionalPlusTerm.1.tree@->regStor = getNextRegister(@OptionalPlusTerm.0.tree@->regStor);
                        @}
                        |   '+' Term
                        @{
                            @i @OptionalPlusTerm.tree@ = @Term.tree@ ;
                        @}
                        ;

OptionalMalTerm         :   '*' Term OptionalMalTerm
                        @{
                            @i @OptionalMalTerm.0.tree@ = createNode(OP_MUL, @Term.tree@, @OptionalMalTerm.1.tree@); 
                            @reg @Term.tree@->regStor = @OptionalMalTerm.0.tree@->regStor; @OptionalMalTerm.1.tree@->regStor = getNextRegister(@OptionalMalTerm.0.tree@->regStor);
                        @}
                        |   '*' Term
                        @{
                            @i @OptionalMalTerm.tree@ = @Term.tree@ ;
                        @}
                        ;

OptionalAndTerm         :   AND Term OptionalAndTerm
                        @{
                            @i @OptionalAndTerm.0.tree@ = createNode(OP_AND, @Term.tree@, @OptionalAndTerm.1.tree@); 
                            @reg @Term.tree@->regStor = @OptionalAndTerm.0.tree@->regStor; @OptionalAndTerm.1.tree@->regStor = getNextRegister(@OptionalAndTerm.0.tree@->regStor);
                        @}
                        |   AND Term
                        @{
                            @i @OptionalAndTerm.tree@ = @Term.tree@ ;
                        @}
                        ;

Term                    :   '(' Expr ')'
                        @{
                            @i @Term.tree@ = @Expr.tree@ ; 
                        @}
                        |   NUM
                        @{
                            @i @Term.tree@ = createNumericalLeaf(@NUM.value@); 
                        @}
                        |   THIS
                        @{
                            @i @Term.tree@ = createThisLeaf(); 
                        @}
                        |   NULL_VAL ID
                        @{
                            /* check what ´NULL ID` does */
                            @i @Term.tree@ = createNULLLeaf();
                            @visCheck isVisible(@Term.ids@,@ID.name@, INTERFACE_DING, @ID.lineNr@);
                        @}
                        |   ID
                        @{
                            @visCheck isVisibleForZuweisungOrZugriff(@Term.ids@,@ID.name@,@ID.lineNr@);

                            @i @Term.tree@ = createComplexIdentifierLeaf(@ID.name@, getTypeOfName(@Term.ids@, @ID.name@), getParameterIndex(@Term.ids@, @ID.name@), getTypeOfName(@Term.ids@, @ID.name@) == CLASS_VAR ? getClassVarOffset(@Term.ids@, @ID.name@) : getLocalVarOffset(@Term.ids@, @ID.name@));
                        @}
                        |   Term '.' ID '(' ')'
                        @{
                            @visCheck isVisible(@Term.ids@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);

                            @i @Term.0.tree@ = createNode(OP_SIMPLE_FUNCTION_CALL, @Term.1.tree@, createComplexIdentifierLeaf(@ID.name@, ABSTRACT_METH, -1, -1));
                            @reg @Term.1.tree@->regStor = @Term.0.tree@->regStor /* ich kanns durchschleifen */ ;
                        @}
                        |   Term '.' ID '(' ParamsExpr ')'
                        @{
                            @visCheck isVisible(@Term.ids@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);

                            @i @Term.0.tree@ = createComplexFuncNode(OP_COMPLEX_FUNC,
                                @ParamsExpr.tree@,
                                createNode(OP_COMPLEX_FUN_LEFT, @Term.1.tree@, createComplexIdentifierLeaf(@ID.name@, ABSTRACT_METH, -1, -1)),
                                @ParamsExpr.paramsRegIdOut@
                            );
                            @reg @Term.1.tree@->regStor = @Term.0.tree@->regStor /* ich kanns durchschleifen */ ;
                            @reg @ParamsExpr.tree@->regStor = getNextRegister(@Term.1.tree@->regStor);
                            
                            
                            @i @ParamsExpr.paramsRegIdIn@ = 1;

                        @}
                        ;

ParamsExpr              :   Expr
                        @{
                            @i @ParamsExpr.tree@ = createParamNode(OP_COMPLEX_FUN_PARAM,@Expr.tree@,createEmptyLeaf(),getParameterRegister(@ParamsExpr.paramsRegIdIn@),"");
                            @reg @Expr.tree@->regStor = @ParamsExpr.tree@->regStor;

                        
                            @i @ParamsExpr.paramsRegIdOut@ = @ParamsExpr.paramsRegIdIn@;
                        @}
                        |   ParamsExprLoop Expr
                        @{
                            @i @ParamsExprLoop.paramsRegIdIn@ = @ParamsExpr.paramsRegIdIn@;
                            @i @ParamsExpr.paramsRegIdOut@ = @ParamsExprLoop.paramsRegIdOut@ +1;

                            @i @ParamsExpr.tree@ = createParamNode(OP_COMPLEX_FUN_PARAM, @ParamsExprLoop.tree@, @Expr.tree@, getParameterRegister(@ParamsExpr.paramsRegIdIn@), getParameterRegister(@ParamsExprLoop.paramsRegIdOut@ +1)); 
                            
                            @reg @ParamsExprLoop.tree@->regStor = @ParamsExpr.tree@->regStor; @Expr.tree@->regStor = getNextRegister(@ParamsExpr.tree@->regStor);
                        @}
                        ;

ParamsExprLoop          :   Expr ','
                        @{
                            @i @ParamsExprLoop.tree@ = @Expr.tree@;
                            @reg @Expr.tree@->regStor = @ParamsExprLoop.tree@->regStor;

                            @i @ParamsExprLoop.paramsRegIdOut@ = @ParamsExprLoop.paramsRegIdIn@;
                        @}
                        |   ParamsExprLoop Expr ',' 
                        @{

                            @i @ParamsExprLoop.1.paramsRegIdIn@ = @ParamsExprLoop.0.paramsRegIdIn@;
                            @i @ParamsExprLoop.0.paramsRegIdOut@ = @ParamsExprLoop.1.paramsRegIdOut@ + 1;


                            
                            @i @ParamsExprLoop.0.tree@ = createParamNode(OP_COMPLEX_FUN_PARAM, @ParamsExprLoop.1.tree@, @Expr.tree@, getParameterRegister(@ParamsExprLoop.0.paramsRegIdIn@), getParameterRegister(@ParamsExprLoop.1.paramsRegIdOut@ + 1));  
                            
                            @reg @ParamsExprLoop.1.tree@->regStor = @ParamsExprLoop.0.tree@->regStor; @Expr.tree@->regStor = getNextRegister(@ParamsExprLoop.0.tree@->regStor);
                        @}
                        ;

%%
int main(void) {
        yyparse();
        return 0;
}

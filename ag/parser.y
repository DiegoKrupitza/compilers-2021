/*************************/
/******* notes **********/
/*  [] = 1 or 0 mal ****/
/*  {} = zero or more */
/*********************/
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char const*);

extern int yylex();

%}

%define parse.error verbose
%locations

%union { unsigned long number; char* id; }

%token <id> ID
%token <number> NUM


%token      INTERFACE CLASS IMPLEMENTS VAR METHOD INT RETURN IF THEN ELSE WHILE DO NOT AND NEW THIS NULL_VAL END
%token      ':' '(' ')' ',' ';' '.'
%token      '+' '*' '-' '<' '=' 
%token      ASSIGNOP
%left       '+'
%left       '*'
%left       '-'
%left       '<'
%right      '='
%start      Programm
%%
Programm                :   ProgrammStart Programm
                        |
                        ;

ProgrammStart           :   Interface ';'
                        |   Class ';'
                        ;

Interface               :   INTERFACE ID ':'
                                AbstraktMethodsLoop
                            END
                        ;

AbstraktMethodsLoop     :   AbstraktMethod AbstraktMethodsLoop
                        |
                        ;

AbstraktMethod          :   ID '(' ParamTypesLoop ')' ':' Type
                        |   ID '(' ')' ':' Type
                        ;

ParamTypesLoop          :   TypesLoop Type   
                        |   Type
                        ;

TypesLoop               :   TypesLoop Type ','
                        |   Type ',' 
                        ;

Class                   :   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                                MemeberLoop
                            END
                        |   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        |   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        |   CLASS ID
                            IMPLEMENTS ':'
                            END
                        ;

MemeberLoop             :   MemeberLoop Member ';' 
                        |   Member ';'
                        ;

ImplementsLoop          :   ImplementsLoop ID
                        |   ID
                        ;

Member                  :   VAR ID ':' Type
                        |   METHOD ID '(' ')' Stats END
                        |   METHOD ID '(' Pars ')' Stats END
                        ;

Type                    :   INT
                        |   ID
                        ;

Pars                    :   ParsLoop Par
                        |   Par
                        ;

ParsLoop                :   ParsLoop Par ','
                        |   Par ','
                        ;

Par                     :   ID ':' Type
                        ;

Stats                   :   Stat ';' Stats
                        |
                        ;

Stat                    :   RETURN Expr
                        |   IF Expr THEN Stats END
                        |   IF Expr THEN Stats ELSE Stats END
                        |   WHILE Expr DO Stats END
                        |   VAR ID ':' Type ASSIGNOP Expr
                        |   ID ASSIGNOP Expr
                        |   Expr
                        ;

Expr                    :   Term
                        |   OptionaNot Term
                        |   Term OptionalPlusTerm
                        |   Term OptionalMalTerm
                        |   Term OptionalAndTerm
                        |   Term SpecialOperation Term
                        |   NEW ID
                        ;

OptionaNot              :   NOT OptionaNot
                        |   NOT
                        ;

OptionalPlusTerm        :   '+' Term OptionalPlusTerm
                        |   '+' Term
                        ;

OptionalMalTerm         :   '*' Term OptionalMalTerm
                        |   '*' Term
                        ;

OptionalAndTerm         :   AND Term OptionalAndTerm
                        |   AND Term
                        ;

SpecialOperation        :   '-'
                        |   '<'
                        |   '='
                        ;

Term                    :   '(' Expr ')'
                        |   NUM
                        |   THIS
                        |   NULL_VAL ID
                        |   ID
                        |   Term '.' ID '(' ')'
                        |   Term '.' ID '(' ParamsExpr ')'
                        ;

ParamsExpr              :   Expr
                        |   ParamsExprLoop Expr
                        ;

ParamsExprLoop          :   Expr ','
                        |   ParamsExprLoop Expr ',' 
                        ;

%%
int main(void) {
        yyparse();
        return 0;
}

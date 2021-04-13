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
%start      Start

@autoinh ids

@attributes { char *name; int lineNr; } ID
@attributes { node_t* in; } Programm
@attributes { node_t* in; node_t* out; } ProgrammStart Interface AbstraktMethodsLoop AbstraktMethod Class MemeberLoop Member Stats Pars Par ParsLoop
@attributes { node_t* in; } Type ParamTypesLoop TypesLoop ImplementsLoop

@traversal @postorder visCheck

%%

Start                   :   Programm
                        @{
                            @i @Programm.in@ = newList();
                        @}
                        ;

Programm                :   ProgrammStart Programm
                        @{
                            @i @ProgrammStart.in@ = @Programm.0.in@ ;
                            @i @Programm.1.in@ = @ProgrammStart.out@ ;
                        @}
                        |
                        ;

ProgrammStart           :   Interface ';'
                            @{
                                @i @Interface.in@ = @ProgrammStart.in@ ;
                                @i @ProgrammStart.out@ = @Interface.out@ ;
                            @}
                        |   Class ';'
                        @{
                            @i @Class.in@ = @ProgrammStart.in@ ;
                            @i @ProgrammStart.out@ = @Class.out@ ;
                        @}
                        ;

Interface               :   INTERFACE ID ':'
                                AbstraktMethodsLoop
                            END
                        @{
                            @i @AbstraktMethodsLoop.in@ = add(@Interface.in@,@ID.name@,INTERFACE,@ID.lineNr@);
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
                            @i @AbstraktMethod.out@ = add(@AbstraktMethod.in@,@ID.name@,ABSTRACT_METH,@ID.lineNr@);
                            @i @ParamTypesLoop.in@ = @AbstraktMethod.out@ ;
                            @i @Type.in@ = @AbstraktMethod.out@ ;
                        @}
                        |   ID '(' ')' ':' Type
                        @{
                            @i @AbstraktMethod.out@ = add(@AbstraktMethod.in@,@ID.name@,ABSTRACT_METH,@ID.lineNr@);
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
                        |   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        @{
                            @i @MemeberLoop.in@ = @Class.in@ ; 
                        @}
                        |   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        @{
                            @i @Class.out@ = add(@Class.in@,@ID.name@,CLASS,@ID.lineNr@);
                            @i @ImplementsLoop.in@ = @Class.in@;
                        @}
                        |   CLASS ID
                            IMPLEMENTS ':'
                            END
                        @{
                            @i @Class.out@ = add(@Class.in@,@ID.name@,CLASS,@ID.lineNr@);
                        @}
                        ;

MemeberLoop             :   MemeberLoop Member ';' 
                        @{
                            @i @MemeberLoop.1.in@ = @MemeberLoop.0.in@ ;
                            @i @Member.in@ = @MemeberLoop.1.out@ ;
                            @i @MemeberLoop.0.out@ = @Member.out@;
                        @}
                        |   Member ';'
                        @{
                            @i @Member.in@ = @MemeberLoop.in@ ; 
                            @i @MemeberLoop.out@ = @Member.out@;
                        @}
                        ;

ImplementsLoop          :   ImplementsLoop ID
                        @{
                            @i @ImplementsLoop.1.in@ = @ImplementsLoop.0.in@ ;
                            @visCheck isVisible(@ImplementsLoop.0.in@,@ID.name@, INTERFACE, @ID.lineNr@);
                        @}
                        |   ID
                        @{
                            @visCheck isVisible(@ImplementsLoop.in@,@ID.name@, INTERFACE, @ID.lineNr@);
                        @}
                        ;

Member                  :   VAR ID ':' Type
                        @{
                            @i @Member.out@ = add(@Member.in@,@ID.name@,CLASS_VAR,@ID.lineNr@);
                            @i @Type.in@ = @Member.in@ ; 
                        }
                        |   METHOD ID '(' ')' Stats END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @Stats.in@ = @Member.in@ ;
                        @}
                        |   METHOD ID '(' Pars ')' Stats END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @Pars.in@ = @Member.in@ ;
                            @i @Stats.in@ = merge(@Member.in@, @Pars.out@);
                        @}
                        ;

Type                    :   INT
                        |   ID
                        @{
                            @visCheck isVisible(@Type.in@,@ID.name@, INTERFACE, @ID.lineNr@);
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
                            @i @Par.out@ = add(@Par.in@,@ID.name@,PARAMETER,@ID.lineNr@);
                        @}
                        ;

Stats                   :   Stat ';' Stats
                        @{
                            @i @Stat.in@ = @Stats.0.in@ ;
                            @i @Stats.1.in@ = @Stat.out@ ;
                            @i @Stats.1.out@ = @Stats.0.out@;
                        @}
                        |
                        @{
                            @i @Stats.out@ = @Stats.in@ ;
                        @}
                        ;

Stat                    :   RETURN Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                        }
                        |   IF Expr THEN Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                        }
                        |   IF Expr THEN Stats ELSE Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ; 
                            @i @Stats.0.in@ = @Stat.in@ ;
                            @i @Stats.1.in@ = @Stat.in@ ;
                        @}
                        |   WHILE Expr DO Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                        }
                        |   VAR ID ':' Type ASSIGNOP Expr
                        @{
                            @
                        @}
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

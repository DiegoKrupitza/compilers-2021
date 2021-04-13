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
@attributes { node_t* in; node_t* out; } ProgrammStart Interface AbstraktMethodsLoop AbstraktMethod Class MemeberLoop Member Stats Stat Pars Par ParsLoop
@attributes { node_t* in; } Type ParamTypesLoop TypesLoop ImplementsLoop StatsMethode
@attributes { node_t* ids; } Expr OptionaNot OptionalPlusTerm OptionalMalTerm OptionalAndTerm SpecialOperation Term ParamsExpr ParamsExprLoop

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
                        @}
                        |   CLASS ID
                            IMPLEMENTS ':'
                                MemeberLoop
                            END
                        @{
                            @i @MemeberLoop.in@ = addDev(duplicate(@Class.in@),@ID.name@,CLASS_DING,@ID.lineNr@,"CLass Id hinzufuegen für Member2");
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id2");
                        @}
                        |   CLASS ID
                            IMPLEMENTS ImplementsLoop ':'
                            END
                        @{
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id3");
                            @i @ImplementsLoop.in@ = @Class.in@;
                        @}
                        |   CLASS ID
                            IMPLEMENTS ':'
                            END
                        @{
                            @i @Class.out@ = addDev(@Class.in@,@ID.name@,CLASS_DING,@ID.lineNr@,"Add von Class out der Class id4");
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
                        @}
                        |   METHOD ID '(' ')' StatsMethode END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @StatsMethode.in@ = @Member.in@ ;
                            @i @Member.out@ = @Member.in@;
                        @}
                        |   METHOD ID '(' Pars ')' StatsMethode END
                        @{
                            @visCheck isVisible(@Member.in@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                            @i @Pars.in@ = duplicate(@Member.in@);
                            @i @Member.out@ = duplicate(@Member.in@);
                            @i @StatsMethode.in@ = @Pars.out@ ;
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
                        @}
                        ;

Stats                   :   Stat ';' Stats
                        @{
                            @i @Stat.in@ = @Stats.0.in@ ;
                            @i @Stats.1.in@ = @Stat.out@ ;
                            @i @Stats.0.out@ = @Stats.1.out@;
                        @}
                        |
                        @{
                            @i @Stats.out@ = @Stats.in@ ;
                        @}
                        ;

Stat                    :   RETURN Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        |   IF Expr THEN Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        |   IF Expr THEN Stats ELSE Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ; 
                            @i @Stats.0.in@ = @Stat.in@ ;
                            @i @Stats.1.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        |   WHILE Expr DO Stats END
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stats.in@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        |   VAR ID ':' Type ASSIGNOP Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = addDev(duplicate(@Stat.in@),@ID.name@,VARIABLE,@ID.lineNr@,"Var assignment in stat");
                            @i @Type.in@ = @Stat.in@ ;
                        @}
                        |   ID ASSIGNOP Expr
                        @{
                            @visCheck isVisibleForZuweisungOrZugriff(@Stat.in@,@ID.name@,@ID.lineNr@);
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        |   Expr
                        @{
                            @i @Expr.ids@ = @Stat.in@ ;
                            @i @Stat.out@ = @Stat.in@ ;
                        @}
                        ;

Expr                    :   Term
                        |   OptionaNot Term
                        |   Term OptionalPlusTerm
                        |   Term OptionalMalTerm
                        |   Term OptionalAndTerm
                        |   Term SpecialOperation Term
                        |   NEW ID
                        @{
                            @visCheck isVisible(@Expr.ids@,@ID.name@, CLASS_DING, @ID.lineNr@);
                        @}
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
                        @{
                            @visCheck isVisible(@Term.ids@,@ID.name@, INTERFACE_DING, @ID.lineNr@);
                        @}
                        |   ID
                        @{
                            @visCheck isVisibleForZuweisungOrZugriff(@Term.ids@,@ID.name@,@ID.lineNr@);
                        @}
                        |   Term '.' ID '(' ')'
                        @{
                            @visCheck isVisible(@Term.ids@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                        @}
                        |   Term '.' ID '(' ParamsExpr ')'
                        @{
                            @visCheck isVisible(@Term.ids@,@ID.name@, ABSTRACT_METH, @ID.lineNr@);
                        @}
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

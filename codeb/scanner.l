%{
#include <stdio.h>
#include <string.h>

#include "y.tab.h"

#include "list.h"
#include "tree.h"
#include "implemented_meth_list.h"
#include "code_injection.h"

%}

/**************************/
/******* defintion *******/
/************************/
%%
"if"                          {   return IF;  }
"int"                         {   return INT;  }
"interface"                   {   return INTERFACE;  }
"end"                         {   return END;  }
"class"                       {   return CLASS;  }
"implements"                  {   return IMPLEMENTS;  }
"var"                         {   return VAR;  }
"method"                      {   return METHOD;  }
"return"                      {   return RETURN;  }
"then"                        {   return THEN;  }
"else"                        {   return ELSE;  }
"while"                       {   return WHILE;  }
"do"                          {   return DO;  }
"not"                         {   return NOT;  }
"and"                         {   return AND;  }
"new"                         {   return NEW;  }
"this"                        {   return THIS;  }
"null"                        {   return NULL_VAL;  }

\;                             return ';';
\:                             return ':';
\(                             return '(';
\)                             return ')';
\.                             return '.';
\,                             return ',';  
\:\=                           return ASSIGNOP;
\+                             return '+';
\*                             return '*';
\-                             return '-';
\<                             return '<';
\=                             return '=';  


[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ } /*https://stackoverflow.com/questions/25395251/detecting-and-skipping-line-comments-with-flex */
[/][*]                                    { exit(1); }


[A-Za-z]+[A-Za-z0-9]*       return ID; @{ @ID.name@ = strdup(yytext); @ID.lineNr@ = yylineno; @}

\n                          ;
[ \t]                       ;

[0-9][0-9a-fA-F]*H          return NUM; @{ @NUM.value@ = strtoul(yytext, NULL, 16); @}

[0-9]+                      return NUM; @{ @NUM.value@ = strtoul(yytext, NULL, 10); @}


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
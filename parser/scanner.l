%{
#include <stdio.h>
#include <string.h>

#include "y.tab.h"

%}

/**************************/
/******* defintion *******/
/************************/
            int num_lines = 1;
%%
if                          {   return IF;  }
int                         {   return INT;  }
interface                   {   return INTERFACE;  }
end                         {   return END;  }
class                       {   return CLASS;  }
implements                  {   return IMPLEMENTS;  }
var                         {   return VAR;  }
method                      {   return METHOD;  }
return                      {   return RETURN;  }
then                        {   return THEN;  }
else                        {   return ELSE;  }
while                       {   return WHILE;  }
do                          {   return DO;  }
not                         {   return NOT;  }
and                         {   return AND;  }
new                         {   return NEW;  }
this                        {   return THIS;  }
null                        {   return NULL_VAL;  }

\;                          {   printf("%s\n",yytext);  }
\:                          {   printf("%s\n",yytext);  }
\(                          {   printf("%s\n",yytext);  }
\)                          {   printf("%s\n",yytext);  }
\.                          {   printf("%s\n",yytext);  }
\,                          {   return ASSIGNOP;  }
\:\=                        {   printf("%s\n",yytext);  }
\+                          {   printf("%s\n",yytext);  }
\*                          {   printf("%s\n",yytext);  }
\-                          {   printf("%s\n",yytext);  }
\<                          {   printf("%s\n",yytext);  }
\=                          {   printf("%s\n",yytext);  }


[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ } /*https://stackoverflow.com/questions/25395251/detecting-and-skipping-line-comments-with-flex */
[/][*]                                    { exit(1); }


[A-Za-z]+[A-Za-z0-9]*       {yylval.id = strdup(yytext); return ID;}

\n                          {   num_lines++; }
[ \t]                       ;

[0-9][0-9a-fA-F]*H          {yylval.number = strtoul(yytext, NULL, 16); return NUM;}

[0-9]+                      {yylval.number = strtoul(yytext, NULL, 10); return NUM;}


.                           {
                                printf("ERROR on line %d Can not lex the symbol: %s\n",num_lines,yytext);
                                exit(1);
                            }

%% 

void yyerror (char const *message)
{

    fprintf(stderr, "Error parsing line: %d char: %s\n%s\n", yylineno,yytext, message);
    exit(2);
}
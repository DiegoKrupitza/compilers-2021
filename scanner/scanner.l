/**************************/
/******* defintion *******/
/************************/
            int num_lines = 1;
%s comment
%%
if                          {   printf("%s\n",yytext);  }
int                         {   printf("%s\n",yytext);  }
interface                   {   printf("%s\n",yytext);  }
end                         {   printf("%s\n",yytext);  }
class                       {   printf("%s\n",yytext);  }
implements                  {   printf("%s\n",yytext);  }
var                         {   printf("%s\n",yytext);  }
method                      {   printf("%s\n",yytext);  }
return                      {   printf("%s\n",yytext);  }
then                        {   printf("%s\n",yytext);  }
else                        {   printf("%s\n",yytext);  }
while                       {   printf("%s\n",yytext);  }
do                          {   printf("%s\n",yytext);  }
not                         {   printf("%s\n",yytext);  }
and                         {   printf("%s\n",yytext);  }
new                         {   printf("%s\n",yytext);  }
this                        {   printf("%s\n",yytext);  }
null                        {   printf("%s\n",yytext);  }

\;                          {   printf("%s\n",yytext);  }
\:                          {   printf("%s\n",yytext);  }
\(                          {   printf("%s\n",yytext);  }
\)                          {   printf("%s\n",yytext);  }
\.                          {   printf("%s\n",yytext);  }
\,                          {   printf("%s\n",yytext);  }
\:\=                        {   printf("%s\n",yytext);  }
\+                          {   printf("%s\n",yytext);  }
\*                          {   printf("%s\n",yytext);  }
\-                          {   printf("%s\n",yytext);  }
\<                          {   printf("%s\n",yytext);  }
\=                          {   printf("%s\n",yytext);  }


[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ } /*https://stackoverflow.com/questions/25395251/detecting-and-skipping-line-comments-with-flex */
[/][*]                                    { exit(1); }


[A-Za-z]+[A-Za-z0-9]*       {
                                //TODO fix asdasds_sdsf case
                                printf("id %s\n",yytext);
                            }

\n                          {   num_lines++; }
[ \t]                       ;

[0-9][0-9a-fA-F]*H          {
                                char* tmpNumber = yytext;
                                tmpNumber[strlen(tmpNumber)-1] = '\0';
                                int number = (int)strtol(tmpNumber, NULL, 16);
                                printf("num %d\n",number);
                            }

[0-9]+                      {
                                int number = atoi(yytext);
                                printf("num %d\n",number);
                            }


.                           {
                                printf("ERROR on line %d Can not lex the symbol: %s\n",num_lines,yytext);
                                exit(1);
                            }

%{
    /* Declaration section - */
#include <math.h>
%}

 /* Definition section - */

/* Rules section(below) - */
%%
"i"|"x"|"y"    printf("Identifier:      %s\n", yytext);
   
[0-9][0-9]*            printf("Integer:         %s\n", yytext);
            

[a-z][a-z]*    printf( "Keyword:        %s\n", yytext);

"+"|"-"|"*"|"/"|">"|"<"|"=="|"="|"!"|"<="|"<<"  printf( "Operator:        %s\n", yytext );

";"|":"   printf("Punctuation:     %s\n", yytext);

\"(\\.|[^"\\])*\"  printf("String:       %s\n", yytext);

[/][/a-zA-Z ]* 

"{"[^}\n]*"}"     

["{"] printf("Seperator:      %s, }\n", yytext);
["}"]
[ \t\n]+          

["("] {printf("Seperator:      %s, )\n", yytext);}
[")"]

%%
/* User Routines section - */
yywrap() {}

int main() {
    printf("Tokens         Lexems\n");
    yylex();
    return 0;
}
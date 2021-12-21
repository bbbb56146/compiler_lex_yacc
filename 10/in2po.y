%{
#include <stdio.h>
#include <ctype.h>
%}

%token DIGIT

%%

line   : expr '\n'  { putchar('\n'); }
       ;

expr   : expr '+' term { putchar('+'); }
       | expr '-' term { putchar('-'); }
       | term
       ;
term   : DIGIT { printf("%d", yylval); }
       ;

%%

int main()
{
    if (yyparse() == 0) printf("The parsing complete\n\n");
    else printf("Systax error\n\n");
}

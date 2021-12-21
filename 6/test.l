%{
    #include <stdio.h>
    #include <stdlib.h>
    enum tnumber {TEOF,TIDEN, TNUM, TASSIGN, TADD, TSUBT, TMUL, TDIV, TSEMI, TBEGIN, TEND, TERROR};
%}

/* 이름 n 치환식 */
letter  [a-zA-Z]
digit   [0-9]
%% /*정의 부분*/
"("                           return(TBEGIN);
")"                             return(TEND);
{letter}({letter}|{digit})*     return(TIDEN);
"="                            return(TASSIGN);
"+"                             return(TADD);
"*"                             return(TMUL);
"/"                             return(TDIV);
"-"                             return(TSUBT);
{digit}+                        return(TNUM);
";"                             return(TSEMI);
[ \t\n]                         ;
.                               return(TERROR);
%%/*사용자 부프로그램 부분*/
 main(){
    enum tnumber tn;
    printf("Start of FLEX \n");
    
    while((tn=yylex( )) != TEOF) switch (tn) {
            case TBEGIN     : printf("Left parenthesis \n"); break;
            case TEND       : printf("Right parenthesis \n"); break;
            case TIDEN      : printf("Identifier : %s\n", yytext); break;
            case TASSIGN    : printf("Assign_op \n"); break;
            case TADD       : printf("Add_op \n"); break;
            case TMUL       : printf("Mul_op\n"); break;
            case TDIV       : printf("Div_op\n"); break;
            case TSUBT       : printf("Subt_op\n"); break;
            case TNUM       : printf("Number : %s\n",yytext); break;
            case TSEMI      : printf("Semicolon \n"); break;
            case TERROR     : printf("Error \n"); break;
            }
    yywrap( ); {printf("End of FLEX\n"); return 1;} 
}

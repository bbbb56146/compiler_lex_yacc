%{
%}

%% /*토큰 정의 규칙*/

"c" return(yytext[0]);
"d" return(yytext[0]);
[ \n\t\b] ;


/* This is a scanner that recognizes 32-bit hexadecimal numbers. */

%{
#include <stdio.h>
%}

%%
^0[xX][0-9a-fA-F]{1,8}$		printf("found a hexadecimal number");
%%

main() {
	yylex();
}
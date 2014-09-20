/* This is a Caesar cipher that replaces every letter with the one three letters after an alphabetical order, wrapping around at Z. */

%{
	#include <stdio.h>
	#include <ctype.h>

	void caesar_cipher_encrypt(char *str) {
		int n = 0;
		int mode_lower = 123;
		int a_lower = 97;
		int mode_upper = 91;
		int a_upper = 65;
		char *p = str;
		char q[1<<20];

		int mode = 0;
		int start_char = 0;

		while(*p) {
			if(islower(*p)) {
				mode = mode_lower;
				start_char = a_lower;
			} else {
				mode = mode_upper;
				start_char = a_upper;
			}

			int c = ((int)*p + 3) % mode;

			if(c < 3) {
				c += start_char;
			}

			q[n] = (char)c;

			p++;
			n++;
		}

		q[n++]='\0';
		printf("%s",q);
	}
%}

%%
[a-zA-Z]*		caesar_cipher_encrypt(yytext);
%%

main() {
	yylex();
}

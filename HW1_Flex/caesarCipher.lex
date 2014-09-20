%{
#include <stdio.h>
#include <ctype.h>

void caesar_cipher_encrypt(char *str)
{
	int n=0;
	int mode_lower = 123;
	int mode_upper = 91;
	int a_lower = 97;
	int a_upper = 65;
	char *p=str;
	char q[1<<20];

	int mode = 0;
	int start_character = 0;

	while(*p)
	{
	 if(islower(*p))
	 {
	 	mode = mode_lower;
	 	start_character = a_lower;
	 }
	 else{
	 	mode = mode_upper;
	 	start_character = a_upper;
	 }

	 	int c = ((int)*p +3)%mode;
	 	if(c<3){
	 		q[n] = (char)(start_character+c);
	 	}
	 	else{
		 	q[n]= (char)c;
	 	}
	
	 n++; p++;
	}

	q[n++]='\0';
	printf("%s",q);
}

%}

%%
[a-zA-Z]*	caesar_cipher_encrypt(yytext);
%%

main()
{
  yylex();
}


%{
	#include <stdio.h>
	char filename[100];	
%}
%%
^interface[ ].*$	{
	printf("%s:%s\n", filename, yytext);
}
(.|\n)	;
%%
void main(int argc, char **argv){
	strncpy(filename, argv[1], strlen(argv[1]));
	filename[strlen(argv[1])] ='\0';

	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}

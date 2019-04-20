%{
	/* Program to count words, characters and lines */
	unsigned charCount=0, wordCount=0, lineCount=0;
%}
chara   [^ \s]
word	[^ \t\n]+
eol	\n
%%
{word}	{wordCount++; charCount+=yyleng;}
{eol}	{lineCount++;}
{chara}	{charCount++;}
%%
int yywrap()
{
	return 1;
}
int main()	
{	
	extern FILE *yyin;
	yyin = fopen("input", "r");
	yylex();
	printf("%d %d %d", lineCount, wordCount, charCount);
	return 0;
}

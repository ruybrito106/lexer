%%

%line
%column
%unicode
%standalone

%class LexAnalyzer

%{

int TokenCounter = 0;

%}

%eof{

System.out.println("Seu programa possui exatamente " + TokenCounter + " identificadores.");

%eof}

slashs           = [//]
multislashbegin      = [/*]
multislashend         = [*/]
underline   = [_]
letter          = [A-Za-z]
firstdigit      = [1-9]
digit           = [0-9]
zero            = [0]
integer         = {zero}|(({firstdigit})({digit})*)
alphanumeric    = {letter}|{digit}
identifier      = ({underline}|{letter})({alphanumeric})*
whitespace      = [ \n\t\r\f]
singlelinecomment   = ({slashs})(({alphanumeric})*)([ \n])
multilinecomment    = ({multislashbegin})(({alphanumeric}|{whitespace})*)({multislashend})



%%



"boolean"       {System.out.println("Encontrou BOOLEAN");}
"class"       {System.out.println("Encontrou CLASS");}
"public"       {System.out.println("Encontrou PUBLIC");}
"extends"       {System.out.println("Encontrou EXTENDS");}
"static"       {System.out.println("Encontrou STATIC");}
"void"       {System.out.println("Encontrou VOID");}
"main"       {System.out.println("Encontrou MAIN");}
"String"       {System.out.println("Encontrou STRING");}
"int"       {System.out.println("Encontrou INT");}
"while"       {System.out.println("Encontrou WHILE");}
"if"       {System.out.println("Encontrou IF");}
"else"       {System.out.println("Encontrou ELSE");}
"return"       {System.out.println("Encontrou RETURN");}
"true"       {System.out.println("Encontrou TRUE");}
"false"       {System.out.println("Encontrou FALSE");}
"length"       {System.out.println("Encontrou LENGTH");}
"this"       {System.out.println("Encontrou THIS");}
"new"       {System.out.println("Encontrou NEW");}
"System.out.println;"       {System.out.println("Encontrou SYSTEM PRINT CALL");}
"&&"            { System.out.println("Encontrou &&"); }
"<"               { System.out.println("Encontrou <"); }
"=="            { System.out.println("Encontrou =="); }
"!="            { System.out.println("Encontrou !="); }
"!"            { System.out.println("Encontrou !"); }
"*"              { System.out.println("Encontrou *"); }
"+"             { System.out.println("Encontrou +"); }
"-"              { System.out.println("Encontrou -"); }
"("              { System.out.println("Encontrou ("); }
")"              { System.out.println("Encontrou )"); }
"["              { System.out.println("Encontrou ["); }
"]"              { System.out.println("Encontrou ]"); }
"{"              { System.out.println("Encontrou {"); }
"}"              { System.out.println("Encontrou }"); }
";"              { System.out.println("Encontrou ;"); }
"."              { System.out.println("Encontrou ."); }
","              { System.out.println("Encontrou ,"); }
"="              { System.out.println("Encontrou ="); }
{identifier}        { TokenCounter++; System.out.println("Encontrou ID ("+yytext()+")"); }
{integer}           { System.out.println("Encontrou Inteiro ("+yytext()+")"); }
{whitespace}     { System.out.println("Encontrou espaço em branco.");}
{singlelinecomment}     {System.out.println("Encontrou comentario em uma linha.");}
{multilinecomment}     {System.out.println("Encontrou comentario de multiplas linhas.");}
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
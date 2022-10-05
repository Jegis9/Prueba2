package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z]+
D=[0-9]+
S=[()]*
M=\^[0-9]+
Z=\^[0-9]+\/[0-9]+
Q=[0-9]+\/[0-9]+
E= ([+]{1}|[-]{1})+
espacio=[ ]+
%{
    public String lexeme;
%}
%%

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"+" {lexeme=yytext(); return Adiccion;}
"-" {lexeme=yytext(); return Sustracción;}
"/" {lexeme=yytext(); return Division;}
"^" {lexeme=yytext(); return Exponente;}
"(" {lexeme=yytext(); return Parentesis_Abertura;}
")" {lexeme=yytext(); return Parentesis_Cierrte;}
"{" {lexeme=yytext(); return Llave_Abertura;}
"}" {lexeme=yytext(); return Llave_Cierrte;}
"[" {lexeme=yytext(); return Corchete_Abertura;}
"]" {lexeme=yytext(); return Corchete_Cierrte;}

{E}*({D}|{Q})*{L}({M}|{Z})* {lexeme=yytext(); return Monomio;}
{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})* {lexeme=yytext(); return Binomio;}
{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})* {lexeme=yytext(); return Trinomio;}
{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})*{E}*({D}|{Q})*{L}({M}|{Z})* {lexeme=yytext(); return Polinomio;}
{L}+ {lexeme=yytext(); return Letra;}
{D}+ {lexeme=yytext(); return Digito;}
{S}+ {lexeme=yytext(); return Simbolo_Agrupacion;}
{Z}+ {lexeme=yytext(); return Exponente_Fraccionario;}
{Q}+ {lexeme=yytext(); return Numero_Fraccionario;}
{E}+ {lexeme=yytext(); return Simbolo_matematico;}
{espacio}+ {lexeme=yytext(); return Espacio;}
 . {return ERROR;}


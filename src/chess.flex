import java_cup.runtime.*;

%%
%class ChessLexer
%unicode
%cup
%line
%column

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline + 1, yycolumn + 1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline + 1, yycolumn + 1, value);
  }
%}

turno   = [0-9]+\.
coluna  = [a-h]
linha   = [1-8]
peca    = [KQRBN]

%%

{turno}      { return symbol(sym.TURNO, yytext()); }
{coluna}     { return symbol(sym.COLUNA, yytext()); }
{linha}      { return symbol(sym.LINHA, yytext()); }
{peca}       { return symbol(sym.PECA, yytext()); }

"x"          { return symbol(sym.CAPTURA); }
"+"          { return symbol(sym.CHEQUE); }
"O-O-O"      { return symbol(sym.ROQUE_G); }
"O-O"        { return symbol(sym.ROQUE_P); }

[ \t\r\n]+   { /* ignora espacos e quebras de linha */ }

.            { System.err.println("Caractere ilegal: " + yytext()); return symbol(sym.error); }


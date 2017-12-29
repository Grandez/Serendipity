package com.jgg.sdp.parser.lang;

import java_cup.runtime.ComplexSymbolFactory.*;
import java_cup.runtime.Symbol;

import com.jgg.sdp.core.ctes.*;
import com.jgg.sdp.core.exceptions.*;
import com.jgg.sdp.module.base.*;
import com.jgg.sdp.module.factorias.*;
import com.jgg.sdp.module.items.Source;
import com.jgg.sdp.parser.base.*;

import static com.jgg.sdp.parser.lang.CallSym.*;

%%

%public
%class      CallLexer
%extends    GenericLexer
%implements GenericScanner, CobolLexer

%line
%column
%char
%full
%ignorecase
%cup

%xstate  PROC_DIVISION

%xstate COMMENT , QUOTE_STRING
%xstate COPYS   

%{

   String cpyName = null;
   
   public void resetLiteral(String txt) {
      data = true;
      litLine = yyline;
      litColumn = yycolumn;
      cadena = new StringBuilder(txt);
   }

   public Symbol literal(String txt) {
      cadena.append(txt);
      String texto = cadena.toString();
      cadena.setLength(0);
      print("Devuelve LITERAL - " + texto);
      Symbol s = new Symbol(LITERAL, litLine, litColumn, texto);
      return symbolFactory.newSymbol(texto, LITERAL, s);
   }

   public Symbol symbol(int code){
      return symbol(code, yytext());
   }
   
   public Symbol symbol(int code, String txt) {
      data = true;
      print("Devuelve SYMBOL (" + (yyline + 1) + "," + (yycolumn + 1) + ") " + txt);
      Symbol s = new Symbol(code, yyline, yycolumn, txt);
      return symbolFactory.newSymbol(txt, code, s);
   }

%}

%init{
   initLexer();
%init}

%eofval{

    if (yymoreStreams()) {
        module.removeSource();
        yypopStream();
    }
    else {    
        return symbolFactory.newSymbol("EOF", EOF);
    }
        
%eofval}

SPACES=[\ \t]+

ALPHA=[a-zA-Z]+
NUMERO=[+|-]?[0-9]+
DECIMAL=[+|-]?[0-9]+[\.\,]?[0-9]+

id = {ALPHA}({ALPHA}|{NUMERO}|\-)*
SP=[ ]{1}
bloque = {SP}{id} 

%% 

/******************************************************************************/
/******************************************************************************/
/***                      CASOS GENERALES                                   ***/
/******************************************************************************/
/******************************************************************************/

PROCEDURE{SPACES}DIVISION       { pushState(PROC_DIVISION); }

{id}                            { /* Do nothing */ }
\r                              { /* Do nothing */ }
\n                              { /* Do nothing */ }
.                               { /* Do nothing */ }

<PROC_DIVISION> {

   CALL         { return symbol(CALL); }
   COPY         { pushState(COPYS);    }

   {SPACES}     { /* nada */           }
   {id}         { return symbol(ID);   }

   \'           { trimLiteral(true);  pushState(QUOTE_STRING); }
   \"           { trimLiteral(false); pushState(QUOTE_STRING); }  
   ^\*          { pushState(COMMENT);       }
   ^\-          { pushState(COMMENT);       }
   \r           { /* Do nothing */ }
   \n           { /* Do nothing */ }
   .            { /* Do nothing */ }

}

/*
 * Los literales pueden ser con comillas simples o dobles
 * Puede ser "O'Donell" o bien 'dijo: "Hola"'
 * Por eso hay que distinguir las dos formas
 */
 

<QUOTE_STRING> {
  \'               { if (litQuote == true) {
                         popState();
                         return literal("");
                     }
                     else {
                        cadena.append(yytext());
                     }    
                   }
  \"               { if (litQuote == false) {
                         popState();
                         return literal("");
                     }
                     else {
                        cadena.append(yytext());
                     }    
                   }

  \n               { summary.incLines(data);
                     data = false;
                     popState(); 
                   }
  \r               {  }

   .               { cadena.append(yytext()); }
}

<COMMENT> {
  \n            { popState();      }  
  \r            { /* Do nothing */ }                
   .            { /* Do nothing */ } 
}

  
<COPYS> {
    {id}               { if (cpyName == null) {
                             cpyName = yytext();
                             Source src = loadCopy(cpyName);
                             if (src != null) yypushStream(src);
                             popState(); 
                         }    
                       }
    \n                 { /* DO NOTHING */ }
    \r                 { /* DO NOTHING */ }    
    {SPACES}           { /* DO NOTHING */ }
    .                  { /* DO NOTHING */ }
}

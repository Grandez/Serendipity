package com.sdp.parser.lang;

import java_cup.runtime.ComplexSymbolFactory.*;
import java_cup.runtime.Symbol;

import com.sdp.core.ctes.*;
import com.sdp.core.exceptions.*;
import com.sdp.module.base.*;
import com.sdp.module.factorias.*;
import com.sdp.module.items.Source;
import com.sdp.parser.base.*;

import static com.sdp.parser.lang.SYM.*;

%%

%public
%class      OCLexer
%extends    GenericLexer
%implements GenericScanner, ILexer

%line
%column
%char
%full
%ignorecase
%cup

%state  ID_DIVISION , ENV_DIVISION , DATA_DIVISION , PROC_DIVISION
%state  CONF_SECT , IO_SECT

%xstate  EXEC , EMBEDDED

%xstate COMMENT , COMMENT2 , QUOTE_STRING
%xstate COPYS   
%xstate SDP

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

   public Symbol literalEx(String txt) {
      cadena.append(txt);
      String texto = cadena.toString();
      cadena.setLength(0);
      print("Devuelve LITERAL EX - " + texto);
      Symbol s = new Symbol(LITCONCAT, litLine, litColumn, texto);
      return symbolFactory.newSymbol(texto, LITCONCAT, s);
   }
               
   public Symbol symbol(int code){
      return symbol(code, yytext());
   }
   
   public Symbol symbol(int code, String txt) {
      data = true;
      print("Devuelve SYMBOL " + code + " (" + (yyline + 1) + "," + (yycolumn + 1) + ") " + txt);
      Symbol s = new Symbol(code, yyline, yycolumn, txt);
      return symbolFactory.newSymbol(txt, code, s);
   }

   public Symbol symbolic(int value) {
      data = true;
      String txt = Integer.toString(value);
      print("Devuelve SYMBOL (" + (yyline + 1) + "," + (yycolumn + 1) + ") " + txt);
      Symbol s = new Symbol(NUMERO, yyline, yycolumn, txt);
      return symbolFactory.newSymbol(txt, NUMERO, s);
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
PARAGRAPH = {SP}{id} 

SDPD=DESC  | DESCRIPTION
SDPDESC=[>]?[\ \t]+SDP[\ \t]+{SDPD}
SDPEND=[>]?[\ \t]+SDP[\ \t]+END
SDPMASTER=[>]?[\ \t]+SDP[\ \t]+MASTER

%% 

ABEND                       { return symbol(ABEND)              ; }   
ADD                         { return symbol(ADD)                ; }  
ADDRESS                     { return symbol(ADDRESS)            ; }   
AID                         { return symbol(AID)                ; }   
APPLICATION                 { return symbol(APPLICATION)        ; }  
ASKTIME                     { return symbol(ASKTIME)            ; }   
ASSIGN                      { return symbol(ASSIGN)             ; }   
BIF                         { return symbol(BIF)                ; }   
BUILD                       { return symbol(BUILD)              ; }  
CERTIFICATE                 { return symbol(CERTIFICATE)        ; }   
CHANGE                      { return symbol(CHANGE)             ; }   
CHANNEL                     { return symbol(CHANNEL)            ; }  
CLOSE                       { return symbol(CLOSE)              ; }  
CONDITION                   { return symbol(CONDITION)          ; }  
CONTAINER                   { return symbol(CONTAINER)          ; }  
CONVERSE                    { return symbol(CONVERSE)           ; }  
CONVERTTIME                 { return symbol(CONVERTTIME)        ; }   
COUNTER                     { return symbol(COUNTER)            ; }  
CREATE                      { return symbol(CREATE)             ; }  
DATATOXML                   { return symbol(DATATOXML)          ; }  
DCOUNTER                    { return symbol(DCOUNTER)           ; }  
DEEDIT                      { return symbol(DEEDIT)             ; }  
DEFINE                      { return symbol(DEFINE)             ; }   
DELETE                      { return symbol(DELETE)             ; }   
DELETEQ                     { return symbol(DELETEQ)            ; }   
DEQ                         { return symbol(DEQ)                ; }  
DIGEST                      { return symbol(DIGEST)             ; }   
DLI                         { return symbol(DLI)                ; }  
DOCUMENT                    { return symbol(DOCUMENT)           ; }   
ENCYRPTPTKT                 { return symbol(ENCYRPTPTKT)        ; }  
ENDBR                       { return symbol(ENDBR)              ; }   
ENDBROWSE                   { return symbol(ENDBROWSE)          ; }  
ENQ                         { return symbol(ENQ)                ; }   
ENTER                       { return symbol(ENTER)              ; }   
EVENT                       { return symbol(EVENT)              ; }  
EXEC                        { return symbol(EXEC)               ; }   
EXTERNAL                    { return symbol(EXTERNAL)           ; }  
EXTRACT                     { return symbol(EXTRACT)            ; }   
FORMATTIME                  { return symbol(FORMATTIME)         ; }   
FORMFIELD                   { return symbol(FORMFIELD)          ; }  
FREEMAIN                    { return symbol(FREEMAIN)           ; }   
FREEMAIN64                  { return symbol(FREEMAIN64)         ; }   
GET                         { return symbol(GET)                ; }   
GETMAIN                     { return symbol(GETMAIN)            ; }   
GETMAIN64                   { return symbol(GETMAIN64)          ; }   
GET64                       { return symbol(GET64)              ; }   
HANDLE                      { return symbol(HANDLE)             ; }   
HTTPHEADER                  { return symbol(HTTPHEADER)         ; }  
IGNORE                      { return symbol(IGNORE)             ; }   
INSERT                      { return symbol(INSERT)             ; }  
INVOKE                      { return symbol(INVOKE)             ; }   
JOURNALNAME                 { return symbol(JOURNALNAME)        ; }  
JOURNALNUM                  { return symbol(JOURNALNUM)         ; }  
LINK                        { return symbol(LINK)               ; }   
LOAD                        { return symbol(LOAD)               ; }   
MONITOR                     { return symbol(MONITOR)            ; }   
MOVE                        { return symbol(MOVE)               ; }   
OPEN                        { return symbol(OPEN)               ; }   
OPERATOR                    { return symbol(OPERATOR)           ; }  
PARSE                       { return symbol(PARSE)              ; }  
PASSTICKET                  { return symbol(PASSTICKET)         ; }   
PASSWORD                    { return symbol(PASSWORD)           ; }  
PHRASE                      { return symbol(PHRASE)             ; }  
POP                         { return symbol(POP)                ; }   
PUSH                        { return symbol(PUSH)               ; }   
PUT                         { return symbol(PUT)                ; }   
PUT64                       { return symbol(PUT64)              ; }   
QUERY                       { return symbol(QUERY)              ; }   
QUERYPARM                   { return symbol(QUERYPARM)          ; }  
READ                        { return symbol(READ)               ; }   
READNEXT                    { return symbol(READNEXT)           ; }   
READPREV                    { return symbol(READPREV)           ; }   
READQ                       { return symbol(READQ)              ; }   
RECEIVE                     { return symbol(RECEIVE)            ; }   
RELEASE                     { return symbol(RELEASE)            ; }   
REQUEST                     { return symbol(REQUEST)            ; }   
RESETBR                     { return symbol(RESETBR)            ; }   
RETRIEVE                    { return symbol(RETRIEVE)           ; }  
RETURN                      { return symbol(RETURN)             ; }   
REWIND                      { return symbol(REWIND)             ; }   
REWRITE                     { return symbol(REWRITE)            ; }   
ROLLBACK                    { return symbol(ROLLBACK)           ; }  
SECURITY                    { return symbol(SECURITY)           ; }  
SEND                        { return symbol(SEND)               ; }  
SERVICE                     { return symbol(SERVICE)            ; }  
SET                         { return symbol(SET)                ; }  
SIGNAL                      { return symbol(SIGNAL)             ; }   
SIGNOFF                     { return symbol(SIGNOFF)            ; }   
SIGNON                      { return symbol(SIGNON)             ; }   
SOAPFAULT                   { return symbol(SOAPFAULT)          ; }   
STARTBR                     { return symbol(STARTBR)            ; }   
STARTBROWSE                 { return symbol(STARTBROWSE)        ; }  
SUSPEND                     { return symbol(SUSPEND)            ; }   
SYNCPOINT                   { return symbol(SYNCPOINT)          ; }   
TASK                        { return symbol(TASK)               ; }  
TCPIP                       { return symbol(TCPIP)              ; }  
TD                          { return symbol(TD)                 ; }  
TOKEN                       { return symbol(TOKEN)              ; }  
TS                          { return symbol(TS)                 ; }  
TRACENUM                    { return symbol(TRACENUM)           ; }  
TRANSFORM                   { return symbol(TRANSFORM)          ; }   
UNLOCK                      { return symbol(UNLOCK)             ; }   
UPDATE                      { return symbol(UPDATE)             ; }   
URL                         { return symbol(URL)                ; }  
VERIFY                      { return symbol(VERIFY)             ; }   
WAIT                        { return symbol(WAIT)               ; }   
WEB                         { return symbol(WEB)                ; }  
WEBSERVICE                  { return symbol(WEBSERVICE)         ; }  
WRITE                       { return symbol(WRITE)              ; }   
WRITEQ                      { return symbol(WRITEQ)             ; }   
WSACONTEXT                  { return symbol(WSACONTEXT)         ; }   
XCTL                        { return symbol(XCTL)               ; }   
XMLTODATA                   { return symbol(XMLTODATA)          ; }   
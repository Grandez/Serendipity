      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con rewrite
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20003.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA     ASSIGN TO 'ENTRADA'.

       DATA DIVISION.
       
       FILE SECTION.

       FD  ENTRADA.
       01  REGISTRO PIC X(20).

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP20003'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'EA2330EAEAE142DC'.
              05 FILLER PIC X(16) VALUE 'EDAB09967174F795'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 1.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 1 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP20003'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20003'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO ACC OF S14419951(1,1)
           OPEN I-O   ENTRADA

           ADD 1 TO ACC OF S14419951(1,4)
           READ ENTRADA
           MOVE 'OTRO DATO' TO  REGISTRO
           ADD 1 TO ACC OF S14419951(1,5)
           REWRITE REGISTRO
           ADD 1 TO ACC OF S14419951(1,2)
           CLOSE ENTRADA
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20003' 
           STOP RUN.
 

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con open read close
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20001.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ENTRADA ASSIGN TO 'ENTRADA'
                  FILE STATUS IS FS-INPUT
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ENTRADA.
       01  REC-ENTRADA PIC X(80).

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP20001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'EF375130BA197898'.
              05 FILLER PIC X(16) VALUE 'DED49C4369DF575E'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 1.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 1 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.


       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP20001'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20001'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO ACC OF S14419951(1,1)
           OPEN INPUT ENTRADA
           ADD 1 TO ACC OF S14419951(1,4)
           READ ENTRADA.
           DISPLAY REC-ENTRADA
           ADD 1 TO ACC OF S14419951(1,2)
           CLOSE ENTRADA.
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20001' 
           STOP RUN.
 

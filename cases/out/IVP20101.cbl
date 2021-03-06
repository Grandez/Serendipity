      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con WRITE y INVALID KEY
      * No compila. usado para ver
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20101.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SALIDA ASSIGN TO 'SALIDA'
                  FILE STATUS IS FS-OUTPUT
                  ORGANIZATION IS INDEXED
                  RECORD KEY IS CLAVE.

       DATA DIVISION.
       FILE SECTION.

       FD  SALIDA.
       01  REC-SALIDA.
           03 CLAVE PIC 9(05).
           03 DATOS PIC X(75).

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP20101'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '9685D3F800161208'.
              05 FILLER PIC X(16) VALUE '9C0AECA1DFB8FE9C'.
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
                'IVP20101'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20101'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO ACC OF S14419951(1,1)
           OPEN OUTPUT SALIDA
           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.
           ADD 1 TO ACC OF S14419951(1,3)
           WRITE REC-SALIDA INVALID KEY DISPLAY 'INVALID KEY'.
           ADD 1 TO ACC OF S14419951(1,2)
           CLOSE SALIDA.
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP20101' 
           STOP RUN.
 

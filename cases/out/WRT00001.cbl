      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRT00001.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SALIDA ASSIGN TO 'SORTOUT'
                  FILE STATUS IS FS-OUTPUT
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  SALIDA.
       01  REC-SALIDA PIC X(80).

       WORKING-STORAGE SECTION.
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'WRT00001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'F677E974652D38F1'.
              05 FILLER PIC X(16) VALUE '02B2607B2A23B47F'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 7.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 7 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.


       PROCEDURE DIVISION.
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'WRT00001'.
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00001'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO ACC OF S14419952(1,1)
           OPEN OUTPUT SALIDA
           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(2) 
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00001' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(3) 
                 .

           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           ADD 1 TO ACC OF S14419952(1,3)
           WRITE REC-SALIDA.
           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(4) 
               DISPLAY 'ERROR ' FS-OUTPUT
                       ' ESCRIBIENDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00001' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(5) 
                 .

           ADD 1 TO ACC OF S14419952(1,2)
           CLOSE SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(6) 
               DISPLAY 'ERROR ' FS-OUTPUT ' CERRANDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00001' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(7) 
                 .

           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00001' 
           STOP RUN.
 

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * PERFORM con THRU Y UNTIL
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01004.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01004'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'CF66059B799758D7'.
              05 FILLER PIC X(16) VALUE '728315E9EB96D921'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 4.
              05 NPAR BINARY-LONG VALUE 4.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 4 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 5  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC 9 VALUE ZEROS.


       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP01004'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01004'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO1' 
           PERFORM PARRAFO1 THRU PARRAFO3 UNTIL AUX = 1

           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO1' 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01004' 
           STOP RUN.

       PARRAFO1.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(3) 
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(4) 
           DISPLAY 'ENTRA EN PARRAFO3'.
 

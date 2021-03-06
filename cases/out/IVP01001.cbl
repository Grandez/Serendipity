      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM OUTLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01001.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '7984EB533106B21C'.
              05 FILLER PIC X(16) VALUE 'EFCDFC5995FAECBE'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 2.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 2 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP01001'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01001'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO1' 
           PERFORM PARRAFO1
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO1' 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01001' 
           STOP RUN.

       PARRAFO1.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           DISPLAY 'ENTRA EN PARRAFO1'.
 

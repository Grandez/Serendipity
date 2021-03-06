      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM OUTLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01003.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01003'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '2EEC6FF82BCC4F4B'.
              05 FILLER PIC X(16) VALUE '1DDE4C24BA56D9F3'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 5.
              05 NPAR BINARY-LONG VALUE 5.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 5 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 6  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'IVP01003'.
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'IVP01003'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'PARRAFO1' 
           PERFORM PARRAFO1
           CALL TRAP OF S14419952 USING 261 8 S14419952
                'PARRAFO1' 
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'PARRAFO2' 
           PERFORM PARRAFO2 THRU PARRAFO4
           CALL TRAP OF S14419952 USING 261 8 S14419952
                'PARRAFO2' 
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'IVP01003' 
           STOP RUN.

       PARRAFO1.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           ADD  1 TO PAR(5) 
           MOVE 1 TO COB(4) 
           DISPLAY 'ENTRA EN PARRAFO3'.

       PARRAFO4.
           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(5) 
           DISPLAY 'ENTRA EN PARRAFO4'.
 

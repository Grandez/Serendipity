      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * PERFORM inline VACIO
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01017.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01017'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '61E2342C5FFFF79F'.
              05 FILLER PIC X(16) VALUE '1885633E23D69209'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 6.
              05 NPAR BINARY-LONG VALUE 4.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 6 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 5  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9 VALUE ZEROS.
       01 IDX  PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP01017'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01017'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           PERFORM FOREVER

           MOVE 1 TO COB(2) 
           END-PERFORM
           MOVE 1 TO COB(3) 
                      .


           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01017' 
           STOP RUN.

       PARRAFO1.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(4) 
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(5) 
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(6) 
           DISPLAY 'ENTRA EN PARRAFO3'.
 

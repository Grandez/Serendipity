      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - IF Anidado con punto
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10004.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP10004'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '985F696A45C8C0FF'.
              05 FILLER PIC X(16) VALUE '29B194B9E86E1D5C'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 5.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 5 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.

           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP10004'.
           MOVE 1 TO COB(1) 
           MOVE 1 TO FLAG.

           IF FLAG > 1 THEN
           MOVE 1 TO COB(2) 
               IF FLAG > 2
           MOVE 1 TO COB(3) 
                  DISPLAY 'FLAG ES MAYOR DE 2'
           END-IF
           MOVE 1 TO COB(4)
           END-IF
           MOVE 1 TO COB(5)
           .

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP10004' 
           STOP RUN.
 

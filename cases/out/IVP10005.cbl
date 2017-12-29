      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - IF Anidado con end-if
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10005.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP10005'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '1CEDC56ACB2125BD'.
              05 FILLER PIC X(16) VALUE 'A26CDF71EC19155E'.
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
                'IVP10005'.
           MOVE 1 TO COB(1) 
           MOVE 1 TO FLAG.

           IF FLAG > 1 THEN
           MOVE 1 TO COB(2) 
               IF FLAG > 4
           MOVE 1 TO COB(3) 
                  DISPLAY 'FLAG ES MAYOR DE 4'
               END-IF
           MOVE 1 TO COB(4) 
               DISPLAY 'FLAG ES MAYOR DE 1'
           END-IF

           MOVE 1 TO COB(5) 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP10005' 
           STOP RUN.
 

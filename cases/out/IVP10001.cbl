      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - IF CON THEN Y END-IF Y PUNTO
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10001.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP10001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'F05F03396F114C86'.
              05 FILLER PIC X(16) VALUE '30FAB14493C0ED00'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 3.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 3 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.

           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP10001'.
           MOVE 1 TO COB(1) 
           MOVE 1 TO FLAG.

           IF FLAG = 1 THEN 
           MOVE 1 TO COB(2) 
               MOVE 2 TO FLAG
           END-IF
           MOVE 1 TO COB(3) 
                 .

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP10001' 
           STOP RUN.
 

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Tratamiento de variables
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - variables sencillas
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP15001.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14492486.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP15001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '5F0C081713A46AE6'.
              05 FILLER PIC X(16) VALUE 'E3CC769AA3FE4F01'.
           03 FLG-DATA  PIC X(16) VALUE ''.
           03 FLG REDEFINES FLG-DATA PIC 9(01) OCCURS 16
           03 DEPTH BINARY-LONG VALUE ZEROS.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 1.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 1 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.


       PROCEDURE DIVISION.

           CALL TRAP OF S14492486 USING 258 8 S14492486
                'IVP15001'.
           MOVE 1 TO COB(1) 
           MOVE 1 TO FLAG.

           CALL TRAP OF S14492486 USING 259 8 S14492486
                'IVP15001' 
           STOP RUN.
 

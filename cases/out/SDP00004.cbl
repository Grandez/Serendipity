      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Insercion de la working con data division
      *          Tiene WORKING
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00004.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SDP00004'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'C3BFDCD547BB558C'.
              05 FILLER PIC X(16) VALUE 'C9A84069CAD1FB28'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 1.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 1 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'SDP00004'.
           MOVE 1 TO COB(1) 
            DISPLAY "Hola mundo vacio".
 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'SDP00004' 
            .
           .

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Verificar la insercion de codigo antes de STOP RUN
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00101.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SDP00101'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '0C3A0DAAC83762B6'.
              05 FILLER PIC X(16) VALUE '168AE45841BF5E75'.
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
                'SDP00101'.
           MOVE 1 TO COB(1) 
           DISPLAY "Hola mundo sin parrafo pero stop run".
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'SDP00101' 
           STOP RUN.
 

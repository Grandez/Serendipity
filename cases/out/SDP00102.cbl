      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Verificar la insercion de codigo fin de parrado
      *          y de fin de modulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00102.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SDP00102'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '0AD3DE5CBA1A4E08'.
              05 FILLER PIC X(16) VALUE '880957C8DDF38D00'.
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
                'SDP00102'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'MAIN'
           PERFORM MAIN
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'SDP00102'
           GOBACK.
       MAIN.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           DISPLAY "Hola mundo sin parrafo ni stop run".
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'SDP00102' 
           STOP RUN.
 

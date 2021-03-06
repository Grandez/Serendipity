      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Verificar la insercion de codigo fin de parrado
      *          y no de fin de modulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00103.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SDP00103'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '81BF89343DAC29FA'.
              05 FILLER PIC X(16) VALUE '0F90DF1FA06758D5'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 2.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 2 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'SDP00103'.
           CALL TRAP OF S14419952 USING 260 4 S14419952
                'MAIN' 
           MOVE 1 TO COB(1) 
           PERFORM MAIN
           CALL TRAP OF S14419952 USING 261 4 S14419952
                'MAIN' 
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'SDP00103' 
           STOP RUN.
       MAIN.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           DISPLAY "Hola mundo en parrafo sin stop run".
 

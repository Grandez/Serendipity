      * SDP DESCRIPTION
      *  IVP - Program Hello World
      *  No tiene parrafos
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP00001.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP00001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '5AEB8E9E6D0B199F'.
              05 FILLER PIC X(16) VALUE '419E2239A19166C8'.
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
                'IVP00001'.
           MOVE 1 TO COB(1) 
           DISPLAY 'Hello World'.
 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP00001' 
            .
           .

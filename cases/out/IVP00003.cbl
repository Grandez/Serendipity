      * SDP DESCRIPTION
      *  IVP - Program Hello World
      *  Un unico parrafo Y end-program
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP00003.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP00003'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'FEBDC7936110B8D8'.
              05 FILLER PIC X(16) VALUE '05AB0809679697C1'.
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
                'IVP00003'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP00003'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           DISPLAY 'Hello World'.

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP00003' 
            .
       END PROGRAM IVP00003.
 

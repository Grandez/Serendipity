      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM INLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALLIT.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419950.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'CALLIT'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'BF5BF3A44953B856'.
              05 FILLER PIC X(16) VALUE 'DE78661DFFD9719D'.
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
           CALL TRAP OF S14419950 USING 258 6 S14419950
                'CALLIT'.
           CALL TRAP OF S14419950 USING 260 6 S14419950
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419950 USING 259 6 S14419950
                'CALLIT'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419950 USING 264 4 S14419950
                'PEPE' 
           CALL "PEPE"
           CALL TRAP OF S14419950 USING 265 4 S14419950
                'PEPE' 
                      .

           CALL TRAP OF S14419950 USING 259 6 S14419950
                'CALLIT' 
           STOP RUN.
 

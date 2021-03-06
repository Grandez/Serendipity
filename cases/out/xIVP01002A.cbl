      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM INLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01002.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01002'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'B43F50F0F6DE3985'.
              05 FILLER PIC X(16) VALUE 'EDF53DE62C257A62'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 8.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 8 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'IVP01002'.
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'IVP01002'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           PERFORM 5 TIMES
           MOVE 1 TO COB(2) 
                DISPLAY 'PERFORM INLINE 1'
           END-PERFORM
           MOVE 1 TO COB(3) 
           PERFORM FLAG TIMES
           MOVE 1 TO COB(4) 
                DISPLAY 'PERFORM INLINE 2'
           END-PERFORM

           MOVE 1 TO COB(5) 
           PERFORM END-PERFORM
           MOVE 1 TO COB(6) 
                              .

           CALL TRAP OF S14419952 USING 260 8 S14419952
                'PARRAFO1' 
           PERFORM PARRAFO1 FLAG TIMES
           CALL TRAP OF S14419952 USING 261 8 S14419952
                'PARRAFO1' 
           PERFORM
           END-PERFORM
           MOVE 1 TO COB(7) 
                      .   

           CALL TRAP OF S14419952 USING 259 8 S14419952
                'IVP01002' 
           STOP RUN.

       PARRAFO1. 
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(8) 
           DISPLAY 'ENTRA EN PARRAFO1'.
 

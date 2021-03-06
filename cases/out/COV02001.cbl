      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - La complejidad total es alta
      * SDP END
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV02001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'COV02001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '3036DED7AA8876F2'.
              05 FILLER PIC X(16) VALUE 'ABC8E2BBBD131177'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 15.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 15 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'COV02001'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02001'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.
           MOVE 9 TO AUX.

           EVALUATE AUX
               WHEN  1 
           MOVE 1 TO COB(2) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  2 
           MOVE 1 TO COB(3) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  3 
           MOVE 1 TO COB(4) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  4 
           MOVE 1 TO COB(5) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  5 
           MOVE 1 TO COB(6) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  6 
           MOVE 1 TO COB(7) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  7 
           MOVE 1 TO COB(8) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  8 
           MOVE 1 TO COB(9) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN  9 
           MOVE 1 TO COB(10) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN 10 
           MOVE 1 TO COB(11) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN 11 
           MOVE 1 TO COB(12) 
                       DISPLAY 'VALOR DE AUX ' AUX
               WHEN 12 
           MOVE 1 TO COB(13) 
                       DISPLAY 'VALOR DE AUX ' AUX
           END-EVALUATE

           MOVE 1 TO COB(14) 
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02001' 
           STOP RUN.

       PARRAFO-INUTIL.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(15) 
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.
 

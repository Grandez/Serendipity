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
       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
       INICIO.
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.
           MOVE 9 TO AUX.

           EVALUATE AUX
               WHEN  1 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  2 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  3 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  4 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  5 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  6 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  7 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  8 DISPLAY 'VALOR DE AUX ' AUX
               WHEN  9 DISPLAY 'VALOR DE AUX ' AUX
               WHEN 10 DISPLAY 'VALOR DE AUX ' AUX
               WHEN 11 DISPLAY 'VALOR DE AUX ' AUX
               WHEN 12 DISPLAY 'VALOR DE AUX ' AUX
           END-EVALUATE

           STOP RUN.

       PARRAFO-INUTIL.
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.

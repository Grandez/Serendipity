      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - No satisface la cobertura de codigo parcialmente
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV01002.
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

           STOP RUN.

       PARRAFO-INUTIL.
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.

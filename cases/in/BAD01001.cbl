      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  BAD - Tiene sentencias no permitidas
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV01001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 6
                ADD 1 TO AUX
                IF IDX > 4 THEN
                    GO TO PARRAFO-MALO
                END-IF
           END-PERFORM.


           STOP RUN.

       PARRAFO-MALO.
           ADD 1 TO AUX.
           GOBACK.

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - IF Anidado con end-if
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10005.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.

           MOVE 1 TO FLAG.

           IF FLAG > 1 THEN
               IF FLAG > 4
                  DISPLAY 'FLAG ES MAYOR DE 4'
               END-IF
               DISPLAY 'FLAG ES MAYOR DE 1'
           END-IF

           STOP RUN.

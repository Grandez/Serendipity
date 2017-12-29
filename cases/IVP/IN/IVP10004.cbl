      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - IF Anidado con punto
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10004.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.

           MOVE 1 TO FLAG.

           IF FLAG > 1 THEN
               IF FLAG > 2
                  DISPLAY 'FLAG ES MAYOR DE 2'
           .

           STOP RUN.

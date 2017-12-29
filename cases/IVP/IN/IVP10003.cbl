      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Control de la instruccion IF
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de la instruccion IF
      * SDP END 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP10003.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.

           MOVE 1 TO FLAG.

           IF FLAG = 1 THEN 
               MOVE 2 TO FLAG
           .

           STOP RUN.

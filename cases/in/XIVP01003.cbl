      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM OUTLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01003.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM PARRAFO1
           PERFORM PARRAFO2 THRU PARRAFO4
           STOP RUN.

       PARRAFO1.
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           DISPLAY 'ENTRA EN PARRAFO3'.

       PARRAFO4.
           DISPLAY 'ENTRA EN PARRAFO4'.

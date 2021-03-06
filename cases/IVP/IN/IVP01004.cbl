      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * PERFORM con THRU Y UNTIL
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01004.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AUX  PIC 9 VALUE ZEROS.


       PROCEDURE DIVISION.
       INICIO.
           PERFORM PARRAFO1 THRU PARRAFO3 UNTIL AUX = 1

           STOP RUN.

       PARRAFO1.
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           DISPLAY 'ENTRA EN PARRAFO3'.

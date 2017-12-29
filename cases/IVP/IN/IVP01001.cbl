      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM OUTLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01001.


       PROCEDURE DIVISION.
       INICIO.
           PERFORM PARRAFO1
           STOP RUN.

       PARRAFO1.
           DISPLAY 'ENTRA EN PARRAFO1'.

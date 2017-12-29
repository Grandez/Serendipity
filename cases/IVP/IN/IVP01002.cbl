      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01002.


       PROCEDURE DIVISION.
       INICIO.
           PERFORM PARRAFO1 THRU PARRAFO3

           STOP RUN.

       PARRAFO1. 
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           DISPLAY 'ENTRA EN PARRAFO3'.

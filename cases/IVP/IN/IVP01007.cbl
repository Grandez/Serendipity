      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * PERFORM con VARYING Y AFTER Y MENOS 1
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01007.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AUX  PIC  9 VALUE ZEROS.
       01 IDX  PIC 99 VALUE 1.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM PARRAFO1 THRU PARRAFO3
                    VARYING IDX FROM 1 BY 1
                    UNTIL IDX = 10
                    AFTER AUX FROM 2 BY -3
                    UNTIL AUX > 1
                    

           STOP RUN.

       PARRAFO1.
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           DISPLAY 'ENTRA EN PARRAFO3'.

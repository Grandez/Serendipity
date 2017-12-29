      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM
      * PERFORM inline VARYING UNTIL
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01018.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AUX  PIC  9 VALUE ZEROS.
       01 IDX  PIC 99 VALUE 1.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM VARYING AUX FROM 1 BY 4 UNTIL IDX > 6
                DISPLAY 'INLINE VARYING'
           END-PERFORM.


           STOP RUN.

       PARRAFO1.
           DISPLAY 'ENTRA EN PARRAFO1'.

       PARRAFO2.
           DISPLAY 'ENTRA EN PARRAFO2'.

       PARRAFO3.
           DISPLAY 'ENTRA EN PARRAFO3'.

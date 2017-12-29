      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: PERFORM
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - Control de las llamadas a PERFORM INLINE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01002.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WORK-DATA.
           03 FLAG  PIC 9(05) VALUE ZEROS.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM 5 TIMES
                DISPLAY 'PERFORM INLINE 1'
           END-PERFORM
           PERFORM FLAG TIMES
                DISPLAY 'PERFORM INLINE 2'
           END-PERFORM

           PERFORM END-PERFORM.

           PERFORM PARRAFO1 FLAG TIMES
           PERFORM
           END-PERFORM.   

           STOP RUN.

       PARRAFO1. 
           DISPLAY 'ENTRA EN PARRAFO1'.

      ******************************************************************
      * SDP DESCRIPTION
      *   Caracteres no imprimibles
      * SDP END
      ******************************************************************
      
      IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP50005.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE	SECTION.
       01  DATOS.
           03 LITERAL PIC X(08) VALUE 'XXXXXXX'.

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY 'MODULO ' IVP50005.
           STOP RUN.
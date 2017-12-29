      ******************************************************************
      * SDP DESCRIPTION
      *   Comentario multilinea en procedure
      * SDP END
      ******************************************************************
      
      IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP50007.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE	SECTION.
       01  DATOS.
           03 LITERAL PIC X(80) VALUE SPACES.


       PROCEDURE DIVISION.
       INICIO.
           MOVE         'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      -                               'YYYYYYYYYYYYYYYYYYY'
                  TO LITERAL.
                       
           DISPLAY 'MODULO ' IVP50007.
           STOP RUN.
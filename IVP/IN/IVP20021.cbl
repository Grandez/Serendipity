      ******************************************************************
      * SDP DESCRIPTION
      *   Arbol con un nivel de 5 SIN PARAMETROS
      * SDP END
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP20021.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01  RUTINAS.
           03  IVP20020   PIC X(08) VALUE 'IVP20020'.
           03  IVP20031   PIC X(08) VALUE 'IVP20031'.
           03  IVP20022   PIC X(08) VALUE 'IVP20022'.
           03  IVP20023   PIC X(08) VALUE 'IVP20023'.
           03  IVP20024   PIC X(08) VALUE 'IVP20024'.
           03  IVP20025   PIC X(08) VALUE 'IVP20025'.                                                       
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY 'MODULO ' IVP20031.
           CALL IVP20022.
           GOBACK.
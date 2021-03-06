      ******************************************************************
      * SDP DESCRIPTION
      *   COPY INEXITENTE Y ARBOL COMPLETO
      * SDP END
      ******************************************************************

      IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP20032.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       COPY NOCOPY.
       
       01  RUTINAS.
           03  IVP20001   PIC X(08) VALUE 'IVP20001'.
           03  IVP20031   PIC X(08) VALUE 'IVP20031'.
           03  IVP20022   PIC X(08) VALUE 'IVP20022'.
           03  IVP20023   PIC X(08) VALUE 'IVP20023'.
           03  IVP20024   PIC X(08) VALUE 'IVP20024'.
           03  IVP20025   PIC X(08) VALUE 'IVP20025'.                                                       
           03  IVPNOMOD   PIC X(08) VALUE 'IVPNOMOD'.   
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY 'MODULO ' IVP20032.
           CALL IVPNORUT.
           GOBACK.
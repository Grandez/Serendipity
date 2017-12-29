      ******************************************************************
      * SDP DESCRIPTION
      *   Llamada a modulo sin informacion
      * SDP END
      ******************************************************************

      IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP20030.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
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
           DISPLAY 'MODULO ' IVP20030.
           CALL IVP20001.
           CALL IVPNOMOD.
           GOBACK.
      ******************************************************************
      * SDP DESCRIPTION
      *   Arbol con un nivel de 5 SIN PARAMETROS
      * SDP END
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP20025.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01  AUX-DATA.
           03  SW-RUTINA PIC 9(03) VALUE ZEROS.
           
       01  RUTINAS.
           03  IVP20020   PIC X(08) VALUE 'IVP20020'.
           03  IVP20021   PIC X(08) VALUE 'IVP20021'.
           03  IVP20022   PIC X(08) VALUE 'IVP20022'.
           03  IVP20023   PIC X(08) VALUE 'IVP20023'.
           03  IVP20024   PIC X(08) VALUE 'IVP20024'.
           03  IVP20025   PIC X(08) VALUE 'IVP20025'.                                                       
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY 'MODULO ' IVP20025.
           EVALUATE SW-RUTINA
              WHEN 20  CALL IVP20020
              WHEN 21  CALL IVP20021              
              WHEN 22  CALL IVP20022
              WHEN 23  CALL IVP20023              
              WHEN 24  CALL IVP20024              
              WHEN 25  CALL IVP20025              
           END-EVALUATE   
           GOBACK.
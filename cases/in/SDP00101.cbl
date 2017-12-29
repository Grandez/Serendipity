      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Verificar la insercion de codigo antes de STOP RUN
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00101.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           DISPLAY "Hola mundo sin parrafo pero stop run".
           STOP RUN.

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:
      * Purpose: Verificar la insercion de codigo fin de parrado
      *          y no de fin de modulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDP00103.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           PERFORM MAIN
           STOP RUN.
       MAIN.
           DISPLAY "Hola mundo en parrafo sin stop run".

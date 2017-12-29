      ******************************************************************
      * Author: Javier Gonzalez
      * Date:    14/03/2015
      * Purpose:
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SDPD0003.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 CONTADOR PIC 9(03) VALUE ZEROS.

       LINKAGE SECTION.
       PROCEDURE DIVISION.
       INICIO.
           ADD 1 TO CONTADOR.
           DISPLAY CONTADOR.
           GOBACK.

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con rewrite
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20003.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA     ASSIGN TO 'ENTRADA'.

       DATA DIVISION.
       
       FILE SECTION.

       FD  ENTRADA.
       01  REGISTRO PIC X(20).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
       INICIO.
           OPEN I-O   ENTRADA

           READ ENTRADA
           MOVE 'OTRO DATO' TO  REGISTRO
           REWRITE REGISTRO
           CLOSE ENTRADA
           STOP RUN.

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con DELETE
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20004.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA  ASSIGN TO 'ENTRADA'
                           ORGANIZATION IS RELATIVE
                           ACCESS MODE RANDOM
                           RELATIVE KEY IS CLAVE.

       DATA DIVISION.
       
       FILE SECTION.

       FD  ENTRADA.
       01  REGISTRO.
           03 CLAVE PIC 9(5).
           03 DATOS PIC X(40).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
       INICIO.
           OPEN I-O   ENTRADA

           READ ENTRADA
           IF CLAVE = 23
           MOVE 'OTRO DATO' TO  REGISTRO
           DELETE ENTRADA RECORD
           CLOSE ENTRADA
           STOP RUN.

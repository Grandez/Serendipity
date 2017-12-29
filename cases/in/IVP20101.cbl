      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con WRITE y INVALID KEY
      * No compila. usado para ver
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20101.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SALIDA ASSIGN TO 'SALIDA'
                  FILE STATUS IS FS-OUTPUT
                  ORGANIZATION IS INDEXED
                  RECORD KEY IS CLAVE.

       DATA DIVISION.
       FILE SECTION.

       FD  SALIDA.
       01  REC-SALIDA.
           03 CLAVE PIC 9(05).
           03 DATOS PIC X(75).

       WORKING-STORAGE SECTION.
       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.


       PROCEDURE DIVISION.
       INICIO.
           OPEN OUTPUT SALIDA
           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.
           WRITE REC-SALIDA INVALID KEY DISPLAY 'INVALID KEY'.
           CLOSE SALIDA.
           STOP RUN.

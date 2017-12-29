      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
      * SDP DESCRIPTION
      *  IVP - fichero con open read at end perform close
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP20202.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ENTRADA ASSIGN TO 'ENTRADA'
                  FILE STATUS IS FS-INPUT
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ENTRADA.
       01  REC-ENTRADA PIC X(80).

       WORKING-STORAGE SECTION.
       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.


       PROCEDURE DIVISION.
       INICIO.
           OPEN INPUT ENTRADA
           READ ENTRADA AT END PERFORM FIN-DE-FICHERO.
           DISPLAY REC-ENTRADA
           CLOSE ENTRADA.
           STOP RUN.

       FIN-DE-FICHERO.
           DISPLAY 'HA HECHO FIN DE FICHERO'.

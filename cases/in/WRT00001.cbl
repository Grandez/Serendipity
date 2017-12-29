      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRT00001.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SALIDA ASSIGN TO 'SORTOUT'
                  FILE STATUS IS FS-OUTPUT
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  SALIDA.
       01  REC-SALIDA PIC X(80).

       WORKING-STORAGE SECTION.
       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.


       PROCEDURE DIVISION.
       INICIO.
           OPEN OUTPUT SALIDA
           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           WRITE REC-SALIDA.
           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT
                       ' ESCRIBIENDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

           CLOSE SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT ' CERRANDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

           STOP RUN.

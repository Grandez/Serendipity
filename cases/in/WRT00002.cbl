      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Escribir datos
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRT00002.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ENTRADA ASSIGN TO 'SORTIN'
                   FILE STATUS IS FS-INPUT
                   ORGANIZATION IS LINE SEQUENTIAL
                   ACCESS MODE IS SEQUENTIAL.

           SELECT SALIDA ASSIGN TO 'SORTOUT'
                  FILE STATUS IS FS-OUTPUT
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ENTRADA.
       01  REC-ENTRADA PIC X(80).

       FD  SALIDA.
       01  REC-SALIDA PIC X(80).

       WORKING-STORAGE SECTION.
       77 FS-INPUT  PIC XX VALUE SPACES.
       77 FS-OUTPUT PIC XX VALUE SPACES.

       01  WORK-DATA.
           03 ITEMS  PIC 9(05) VALUE ZEROS.
           03 TBDATOS.
              05 DATOS OCCURS 10000 TIMES PIC 9(05).
           03 TBORDEN.
              05 ORDEN OCCURS 10000 TIMES PIC 9(05).
       01  INDICES.
           03  IDX  PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRIR-FICHERO.
           PERFORM LEER-FICHERO.

      *     OPEN INPUT ENTRADA
      *          OUTPUT SALIDA
      *     IF FS-OUTPUT NOT = '00' THEN
      *         DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
      *         STOP RUN RETURNING 16
      *     END-IF.

           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           WRITE REC-SALIDA.
           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           WRITE REC-SALIDA.

               IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT
                       ' ESCRIBIENDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

           CLOSE ENTRADA.
           CLOSE SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT ' CERRANDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

           STOP RUN.

       ABRIR-FICHERO.
           OPEN INPUT ENTRADA
                OUTPUT SALIDA
           IF FS-INPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-INPUT ' ABRIENDO FICHERO DE ENTRADA'
               STOP RUN RETURNING 16
           END-IF.
           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
               STOP RUN RETURNING 16
           END-IF.

       LEER-FICHERO.
           READ ENTRADA
           IF FS-INPUT NOT = '00' AND FS-INPUT NOT = '10'
              DISPLAY 'ERROR ' FS-INPUT ' LEYENDO FICHERO DE ENTRADA'
              STOP RUN RETURNING 16
           END-IF.

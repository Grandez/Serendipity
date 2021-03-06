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
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'WRT00002'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'A439AED8C775B0E1'.
              05 FILLER PIC X(16) VALUE 'A2B5EF9F18382BBA'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 13.
              05 NPAR BINARY-LONG VALUE 3.
              05 NPRS BINARY-LONG VALUE 2.
           03 COB OCCURS 13 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 4  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 3 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

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
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'WRT00002'.
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419952 USING 260 13 S14419952
                'ABRIR-FICHERO' 
           PERFORM ABRIR-FICHERO
           CALL TRAP OF S14419952 USING 261 13 S14419952
                'ABRIR-FICHERO' 
                                .
           CALL TRAP OF S14419952 USING 260 12 S14419952
                'LEER-FICHERO' 
           PERFORM LEER-FICHERO
           CALL TRAP OF S14419952 USING 261 12 S14419952
                'LEER-FICHERO' 
                               .

      *     OPEN INPUT ENTRADA
      *          OUTPUT SALIDA
      *     IF FS-OUTPUT NOT = '00' THEN
      *         DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
      *         STOP RUN RETURNING 16
      *     END-IF.

           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           ADD 1 TO ACC OF S14419952(2,3)
           WRITE REC-SALIDA.
           MOVE 'DATOS DE PRUEBA' TO REC-SALIDA.

           ADD 1 TO ACC OF S14419952(2,3)
           WRITE REC-SALIDA.

               IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(2) 
               DISPLAY 'ERROR ' FS-OUTPUT
                       ' ESCRIBIENDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(3) 
                 .

           ADD 1 TO ACC OF S14419952(1,2)
           CLOSE ENTRADA.
           ADD 1 TO ACC OF S14419952(2,2)
           CLOSE SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(4) 
               DISPLAY 'ERROR ' FS-OUTPUT ' CERRANDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(5) 
                 .

           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
           STOP RUN.

       ABRIR-FICHERO.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(6) 
           ADD 1 TO ACC OF S14419952(1,1)
           ADD 1 TO ACC OF S14419952(2,1)
           OPEN INPUT ENTRADA
                OUTPUT SALIDA
           IF FS-INPUT NOT = '00' THEN
           MOVE 1 TO COB(7) 
               DISPLAY 'ERROR ' FS-INPUT ' ABRIENDO FICHERO DE ENTRADA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(8) 
                 .
           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(9) 
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
               STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(10) 
                 .

       LEER-FICHERO.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(11) 
           ADD 1 TO ACC OF S14419952(1,4)
           READ ENTRADA
           IF FS-INPUT NOT = '00' AND FS-INPUT NOT = '10'
           MOVE 1 TO COB(12) 
              DISPLAY 'ERROR ' FS-INPUT ' LEYENDO FICHERO DE ENTRADA'
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'WRT00002' 
              STOP RUN RETURNING 16
           END-IF
           MOVE 1 TO COB(13) 
                 .
 

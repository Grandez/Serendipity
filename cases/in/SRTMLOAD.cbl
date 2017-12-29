      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Carga datos
      ******************************************************************
      * SDP DESCRIPTION
      *  Carga los datos del fichero de entrada para
      *  los modulos de ordenacion
      * SDP END
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTMLOAD.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ENTRADA ASSIGN TO 'SORTIN'
                   FILE STATUS IS FS-INPUT
                   ORGANIZATION IS LINE SEQUENTIAL
                   ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ENTRADA.
       01  REC-ENTRADA.
           03 DATO PIC 9(05).
           03 F    PIC X(75).

       WORKING-STORAGE SECTION.
       77 FS-INPUT  PIC XX VALUE SPACES.

       01 TBDATOS.
           03 ITEMS PIC 9(05) VALUE 0.
           03 DATOS OCCURS 10000 TIMES PIC 9(05).

       01  INDICES.
           03  IDX  PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       LINKAGE SECTION.
       
       01 LNK-DATOS.
       COPY SRTWDATA.
          
       PROCEDURE DIVISION USING LNK-DATOS.
       INICIO.
           IF ITEMS OF TBDATOS = ZERO
              PERFORM CARGAR-DATOS.

           MOVE TBDATOS TO LNK-DATOS.
           
           GOBACK.

       CARGAR-DATOS.
           OPEN INPUT ENTRADA.

           IF FS-INPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-INPUT ' ABRIENDO FICHERO DE ENTRADA'
               MOVE 16 TO RC
               GOBACK
           END-IF.

           READ ENTRADA
           PERFORM UNTIL FS-INPUT NOT = '00'
              ADD 1 TO ITEMS OF TBDATOS
              MOVE DATO TO DATOS(ITEMS OF TBDATOS)
              READ ENTRADA
           END-PERFORM

           IF FS-INPUT NOT =  '10'
              DISPLAY 'ERROR ' FS-INPUT ' LEYENDO FICHERO DE ENTRADA'
              MOVE 16 TO RC
              GOBACK
           END-IF.

           CLOSE ENTRADA.

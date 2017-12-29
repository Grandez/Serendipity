      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Pruebas
      ******************************************************************
      * SDP DESCRIPTION
      *  Escribe el fichero ordenado resultado de alguno de los 
      *  metodos de ordenacion
      * SDP END
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTMWRIT.
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
       
       77 FS-OUTPUT PIC XX VALUE SPACES.

       01  WORK-DATOS.
           03 IDX PIC 9(05) VALUE ZEROS.
           
       LINKAGE SECTION.
       
       01 DATA-SORT.
       COPY SRTWDATA.
       
       PROCEDURE DIVISION USING DATA-SORT. 
       INICIO.

           PERFORM OPEN-FILE.
           
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > ITEMS
                WRITE REC-SALIDA FROM ORDEN(IDX)
                IF FS-OUTPUT NOT = '00' THEN
                   DISPLAY 'ERROR ' FS-OUTPUT
                           ' ESCRIBIENDO FICHERO DE SALIDA'
                  MOVE 16 TO RC
                  GOBACK
                END-IF
           END-PERFORM.     

           PERFORM CLOSE-FILE.
           
           MOVE ZEROS TO RC
           GOBACK.
           
       OPEN-FILE.
           
           OPEN OUTPUT SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
               MOVE 16 TO RC
               GOBACK
           END-IF.
           
       CLOSE-FILE.
           CLOSE SALIDA.

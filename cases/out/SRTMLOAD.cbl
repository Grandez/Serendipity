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
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTMLOAD'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '08522A3A688B9DA6'.
              05 FILLER PIC X(16) VALUE '6471E87087E86CDA'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 10.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 10 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

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
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTMLOAD'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMLOAD'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           IF ITEMS OF TBDATOS = ZERO
           MOVE 1 TO COB(2) 
           CALL TRAP OF S14420521 USING 260 12 S14420521
                'CARGAR-DATOS' 
              PERFORM CARGAR-DATOS
           CALL TRAP OF S14420521 USING 261 12 S14420521
                'CARGAR-DATOS' 
           END-IF
           MOVE 1 TO COB(3)
                                  .

           MOVE TBDATOS TO LNK-DATOS.
           
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMLOAD' 
           GOBACK.

       CARGAR-DATOS.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(4) 
           ADD 1 TO ACC OF S14420521(1,1)
           OPEN INPUT ENTRADA.

           IF FS-INPUT NOT = '00' THEN
           MOVE 1 TO COB(5) 
               DISPLAY 'ERROR ' FS-INPUT ' ABRIENDO FICHERO DE ENTRADA'
               MOVE 16 TO RC
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMLOAD' 
               GOBACK
           END-IF
           MOVE 1 TO COB(6) 
                 .

           ADD 1 TO ACC OF S14420521(1,4)
           READ ENTRADA
           PERFORM UNTIL FS-INPUT NOT = '00'
           MOVE 1 TO COB(7) 
              ADD 1 TO ITEMS OF TBDATOS
              MOVE DATO TO DATOS(ITEMS OF TBDATOS)
           ADD 1 TO ACC OF S14420521(1,4)
              READ ENTRADA
           END-PERFORM

           MOVE 1 TO COB(8) 
           IF FS-INPUT NOT =  '10'
           MOVE 1 TO COB(9) 
              DISPLAY 'ERROR ' FS-INPUT ' LEYENDO FICHERO DE ENTRADA'
              MOVE 16 TO RC
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMLOAD' 
              GOBACK
           END-IF
           MOVE 1 TO COB(10) 
                 .

           ADD 1 TO ACC OF S14420521(1,2)
           CLOSE ENTRADA.
 

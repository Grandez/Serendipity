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
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTMWRIT'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'C898E02731D30A15'.
              05 FILLER PIC X(16) VALUE 'EC74A408A98DC048'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 9.
              05 NPAR BINARY-LONG VALUE 3.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 9 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 4  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       
       77 FS-OUTPUT PIC XX VALUE SPACES.

       01  WORK-DATOS.
           03 IDX PIC 9(05) VALUE ZEROS.
           
       LINKAGE SECTION.
       
       01 DATA-SORT.
       COPY SRTWDATA.
       
       PROCEDURE DIVISION USING DATA-SORT. 
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTMWRIT'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMWRIT'
           GOBACK.
       INICIO.

           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14420521 USING 260 9 S14420521
                'OPEN-FILE' 
           PERFORM OPEN-FILE
           CALL TRAP OF S14420521 USING 261 9 S14420521
                'OPEN-FILE' 
                            .
           
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > ITEMS
           MOVE 1 TO COB(2) 
           ADD 1 TO ACC OF S14420521(1,3)
                WRITE REC-SALIDA FROM ORDEN(IDX)
                IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(3) 
                   DISPLAY 'ERROR ' FS-OUTPUT
                           ' ESCRIBIENDO FICHERO DE SALIDA'
                  MOVE 16 TO RC
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMWRIT' 
                  GOBACK
                END-IF
           MOVE 1 TO COB(4) 
           END-PERFORM
           MOVE 1 TO COB(5) 
                      .     

           CALL TRAP OF S14420521 USING 260 10 S14420521
                'CLOSE-FILE' 
           PERFORM CLOSE-FILE
           CALL TRAP OF S14420521 USING 261 10 S14420521
                'CLOSE-FILE' 
                             .
           
           MOVE ZEROS TO RC
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMWRIT' 
           GOBACK.
           
       OPEN-FILE.
           
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(6) 
           ADD 1 TO ACC OF S14420521(1,1)
           OPEN OUTPUT SALIDA.

           IF FS-OUTPUT NOT = '00' THEN
           MOVE 1 TO COB(7) 
               DISPLAY 'ERROR ' FS-OUTPUT ' ABRIENDO FICHERO DE SALIDA'
               MOVE 16 TO RC
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTMWRIT' 
               GOBACK
           END-IF
           MOVE 1 TO COB(8) 
                 .
           
       CLOSE-FILE.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(9) 
           ADD 1 TO ACC OF S14420521(1,2)
           CLOSE SALIDA.
 

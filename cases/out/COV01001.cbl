      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - No satisface la cobertura de codigo
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV01001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419950.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'COV01001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '3A61E78C3DE1CFC0'.
              05 FILLER PIC X(16) VALUE '403BBAEC6AC08A79'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 15.
              05 NPAR BINARY-LONG VALUE 3.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 15 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 4  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419950 USING 258 8 S14419950
                'COV01001'.
           CALL TRAP OF S14419950 USING 260 8 S14419950
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419950 USING 259 8 S14419950
                'COV01001'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           MOVE 1 TO AUX.

           CALL TRAP OF S14419950 USING 259 8 S14419950
                'COV01001' 
           STOP RUN.

       PARRAFO-MALO.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           ADD 1 TO AUX.
           CALL TRAP OF S14419950 USING 259 8 S14419950
                'COV01001' 
           GOBACK.

       PARRAFO-BUENO.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 6
           MOVE 1 TO COB(4) 
                ADD 1 TO AUX
                IF IDX > 4 THEN
           MOVE 1 TO COB(5) 
                    GO TO PARRAFO-MALO
                END-IF
           MOVE 1 TO COB(6) 
           END-PERFORM
           MOVE 1 TO COB(7) 
                      .

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 6
           MOVE 1 TO COB(8) 
                ADD 1 TO AUX
                IF IDX > 4 THEN
           MOVE 1 TO COB(9) 
                    GO TO PARRAFO-MALO
                END-IF
           MOVE 1 TO COB(10) 
           END-PERFORM
           MOVE 1 TO COB(11) 
                      .

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 6
           MOVE 1 TO COB(12) 
                ADD 1 TO AUX
                IF IDX > 4 THEN
           MOVE 1 TO COB(13) 
                    GO TO PARRAFO-MALO
                END-IF
           MOVE 1 TO COB(14) 
           END-PERFORM
           MOVE 1 TO COB(15) 
                      .
 

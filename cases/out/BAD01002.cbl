      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  BAD - Contiene sentencias GO TO y DISPLAY
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BAD01002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419950.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'BAD01002'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '73A9C0EAC4839F23'.
              05 FILLER PIC X(16) VALUE '8DE2053CAF0EA3D0'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 6.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 6 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419950 USING 258 8 S14419950
                'BAD01002'.
           CALL TRAP OF S14419950 USING 260 8 S14419950
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419950 USING 259 8 S14419950
                'BAD01002'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 6
           MOVE 1 TO COB(2) 
                ADD 1 TO AUX
                IF IDX > 4 THEN
           MOVE 1 TO COB(3) 
                    GO TO PARRAFO-MALO
                END-IF
           MOVE 1 TO COB(4) 
           END-PERFORM
           MOVE 1 TO COB(5) 
                      .

           DISPLAY 'FIN NORMAL DEL PROGRAMA'
           CALL TRAP OF S14419950 USING 259 8 S14419950
                'BAD01002' 
           STOP RUN.

       PARRAFO-MALO.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(6) 
           ADD 1 TO AUX.
           CALL TRAP OF S14419950 USING 259 8 S14419950
                'BAD01002' 
           GOBACK.
 

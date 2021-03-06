      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - La complejidad del parrafo es alta
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV02003.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'COV02003'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '39DE7185B311953F'.
              05 FILLER PIC X(16) VALUE '3F86A11CDDDEB83B'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 45.
              05 NPAR BINARY-LONG VALUE 5.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 45 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 6  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(18)  VALUE ZEROS.
       01 IDX  PIC  9(05)  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'COV02003'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02003'
           GOBACK.
       INICIO.

           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           MOVE 9 TO AUX.

           CALL TRAP OF S14419951 USING 260 16 S14419951
                'PARRAFO-EXCESIVO' 
           PERFORM PARRAFO-EXCESIVO
           CALL TRAP OF S14419951 USING 261 16 S14419951
                'PARRAFO-EXCESIVO' 
                                   .

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02003' 
           STOP RUN.

       PARRAFO-EXCESIVO.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(3) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 1000
           MOVE 1 TO COB(4) 
                                   COMPUTE AUX = AUX / 2
                                   COMPUTE AUX = AUX * 2
                           END-PERFORM
           MOVE 1 TO COB(5) 
           END-IF
           MOVE 1 TO COB(6) 
                 .

           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX
           ADD 1 TO AUX

           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.
           COMPUTE AUX = AUX - 1.


       PARRAFO4.

           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(7) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(8) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(9) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(10) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(11) 
                       IF AUX > 4 THEN 
           MOVE 1 TO COB(12) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 4000
           MOVE 1 TO COB(13) 
                                   COMPUTE AUX = AUX / 4
                                   COMPUTE AUX = AUX * 4
                           END-PERFORM

           MOVE 1 TO COB(14) 
                       END-IF
           MOVE 1 TO COB(15) 
                    END-IF
           MOVE 1 TO COB(16) 
                 END-IF
           MOVE 1 TO COB(17) 
              END-IF
           MOVE 1 TO COB(18) 
           END-IF
           MOVE 1 TO COB(19) 
                 .

       PARRAFO5.

           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(20) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(21) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(22) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(23) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(24) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(25) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 5000
           MOVE 1 TO COB(26) 
                                   COMPUTE AUX = AUX / 5
                                   COMPUTE AUX = AUX * 5
                           END-PERFORM

           MOVE 1 TO COB(27) 
                       END-IF
           MOVE 1 TO COB(28) 
                    END-IF
           MOVE 1 TO COB(29) 
                 END-IF
           MOVE 1 TO COB(30) 
              END-IF
           MOVE 1 TO COB(31) 
           END-IF
           MOVE 1 TO COB(32) 
                 .

       PARRAFO6.
           
           ADD  1 TO PAR(5) 
           MOVE 1 TO COB(33) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(34) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(35) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(36) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(37) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(38) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 6000
           MOVE 1 TO COB(39) 
                                   COMPUTE AUX = AUX / 6
                                   COMPUTE AUX = AUX * 6
                           END-PERFORM

           MOVE 1 TO COB(40) 
                       END-IF
           MOVE 1 TO COB(41) 
                    END-IF
           MOVE 1 TO COB(42) 
                 END-IF
           MOVE 1 TO COB(43) 
              END-IF
           MOVE 1 TO COB(44) 
           END-IF
           MOVE 1 TO COB(45) 
                 .
 

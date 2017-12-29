      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - La complejidad total es alta
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV02002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'COV02002'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '3C44350CAD9C6EB7'.
              05 FILLER PIC X(16) VALUE 'D27413591A623C53'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 79.
              05 NPAR BINARY-LONG VALUE 7.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 79 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 8  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(18)  VALUE ZEROS.
       01 IDX  PIC  9(05)  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'COV02002'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02002'
           GOBACK.
       INICIO.

           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           MOVE 9 TO AUX.

           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO1' 
           PERFORM PARRAFO1
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO1' 
                           .
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO2' 
           PERFORM PARRAFO2
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO2' 
                           .
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO3' 
           PERFORM PARRAFO3
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO3' 
                           .
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO4' 
           PERFORM PARRAFO4
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO4' 
                           .
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO5' 
           PERFORM PARRAFO5
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO5' 
                           .
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'PARRAFO6' 
           PERFORM PARRAFO6
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'PARRAFO6' 
                           .

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV02002' 
           STOP RUN.

       PARRAFO1.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(3) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(4) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(5) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(6) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(7) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 1000
           MOVE 1 TO COB(8) 
                                   COMPUTE AUX = AUX / 2
                                   COMPUTE AUX = AUX * 2
                           END-PERFORM
           MOVE 1 TO COB(9) 
                       END-IF
           MOVE 1 TO COB(10) 
                    END-IF
           MOVE 1 TO COB(11) 
                 END-IF
           MOVE 1 TO COB(12) 
              END-IF
           MOVE 1 TO COB(13) 
           END-IF
           MOVE 1 TO COB(14) 
                 .

       PARRAFO2.

           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(15) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(16) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(17) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(18) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(19) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(20) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 2000
           MOVE 1 TO COB(21) 
                                   COMPUTE AUX = AUX / 4
                                   COMPUTE AUX = AUX * 4
                           END-PERFORM
           MOVE 1 TO COB(22) 
                       END-IF
           MOVE 1 TO COB(23) 
                    END-IF
           MOVE 1 TO COB(24) 
                 END-IF
           MOVE 1 TO COB(25) 
              END-IF
           MOVE 1 TO COB(26) 
           END-IF
           MOVE 1 TO COB(27) 
                 .

       PARRAFO3.

           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(28) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(29) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(30) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(31) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(32) 
                       IF AUX > 4 THEN 
           MOVE 1 TO COB(33) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 3000
           MOVE 1 TO COB(34) 
                                   COMPUTE AUX = AUX / 3
                                   COMPUTE AUX = AUX * 3
                           END-PERFORM

           MOVE 1 TO COB(35) 
                       END-IF
           MOVE 1 TO COB(36) 
                    END-IF
           MOVE 1 TO COB(37) 
                 END-IF
           MOVE 1 TO COB(38) 
              END-IF
           MOVE 1 TO COB(39) 
           END-IF
           MOVE 1 TO COB(40) 
                 .

       PARRAFO4.

           ADD  1 TO PAR(5) 
           MOVE 1 TO COB(41) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(42) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(43) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(44) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(45) 
                       IF AUX > 4 THEN 
           MOVE 1 TO COB(46) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 4000
           MOVE 1 TO COB(47) 
                                   COMPUTE AUX = AUX / 4
                                   COMPUTE AUX = AUX * 4
                           END-PERFORM

           MOVE 1 TO COB(48) 
                       END-IF
           MOVE 1 TO COB(49) 
                    END-IF
           MOVE 1 TO COB(50) 
                 END-IF
           MOVE 1 TO COB(51) 
              END-IF
           MOVE 1 TO COB(52) 
           END-IF
           MOVE 1 TO COB(53) 
                 .

       PARRAFO5.

           ADD  1 TO PAR(6) 
           MOVE 1 TO COB(54) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(55) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(56) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(57) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(58) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(59) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 5000
           MOVE 1 TO COB(60) 
                                   COMPUTE AUX = AUX / 5
                                   COMPUTE AUX = AUX * 5
                           END-PERFORM

           MOVE 1 TO COB(61) 
                       END-IF
           MOVE 1 TO COB(62) 
                    END-IF
           MOVE 1 TO COB(63) 
                 END-IF
           MOVE 1 TO COB(64) 
              END-IF
           MOVE 1 TO COB(65) 
           END-IF
           MOVE 1 TO COB(66) 
                 .

       PARRAFO6.
           
           ADD  1 TO PAR(7) 
           MOVE 1 TO COB(67) 
           IF AUX > 0 THEN
           MOVE 1 TO COB(68) 
              IF AUX > 1 THEN
           MOVE 1 TO COB(69) 
                 IF AUX > 2 THEN
           MOVE 1 TO COB(70) 
                    IF AUX > 3 THEN
           MOVE 1 TO COB(71) 
                       IF AUX > 4 THEN
           MOVE 1 TO COB(72) 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 6000
           MOVE 1 TO COB(73) 
                                   COMPUTE AUX = AUX / 6
                                   COMPUTE AUX = AUX * 6
                           END-PERFORM

           MOVE 1 TO COB(74) 
                       END-IF
           MOVE 1 TO COB(75) 
                    END-IF
           MOVE 1 TO COB(76) 
                 END-IF
           MOVE 1 TO COB(77) 
              END-IF
           MOVE 1 TO COB(78) 
           END-IF
           MOVE 1 TO COB(79) 
                 .
 

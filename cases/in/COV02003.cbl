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
       01 AUX  PIC  9(18)  VALUE ZEROS.
       01 IDX  PIC  9(05)  VALUE 1.

       PROCEDURE DIVISION.
       INICIO.

           MOVE 9 TO AUX.

           PERFORM PARRAFO-EXCESIVO.

           STOP RUN.

       PARRAFO-EXCESIVO.
           IF AUX > 0 THEN
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 1000
                                   COMPUTE AUX = AUX / 2
                                   COMPUTE AUX = AUX * 2
                           END-PERFORM
           END-IF.

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

           IF AUX > 0 THEN
              IF AUX > 1 THEN
                 IF AUX > 2 THEN
                    IF AUX > 3 THEN
                       IF AUX > 4 THEN 
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 4000
                                   COMPUTE AUX = AUX / 4
                                   COMPUTE AUX = AUX * 4
                           END-PERFORM

                       END-IF
                    END-IF
                 END-IF
              END-IF
           END-IF.

       PARRAFO5.

           IF AUX > 0 THEN
              IF AUX > 1 THEN
                 IF AUX > 2 THEN
                    IF AUX > 3 THEN
                       IF AUX > 4 THEN
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 5000
                                   COMPUTE AUX = AUX / 5
                                   COMPUTE AUX = AUX * 5
                           END-PERFORM

                       END-IF
                    END-IF
                 END-IF
              END-IF
           END-IF.

       PARRAFO6.
           
           IF AUX > 0 THEN
              IF AUX > 1 THEN
                 IF AUX > 2 THEN
                    IF AUX > 3 THEN
                       IF AUX > 4 THEN
                           PERFORM VARYING IDX FROM 1 BY 1
                                   UNTIL IDX > 6000
                                   COMPUTE AUX = AUX / 6
                                   COMPUTE AUX = AUX * 6
                           END-PERFORM

                       END-IF
                    END-IF
                 END-IF
              END-IF
           END-IF.

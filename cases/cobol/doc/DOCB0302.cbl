      * SDP DESCRIPTION
      *  DOC - Programa principal
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DOCB0301.


       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  RUTINAS.
           03 DOCB0311  PIC X(08) VALUE 'DOCB0311'.
           03 DOCB0321  PIC X(08) VALUE 'DOCB0321'.
           03 DOCB0322  PIC X(08) VALUE 'DOCB0322'.

       PROCEDURE DIVISION.
       INICIO.
           CALL 'DOCB0311' USING RUTINAS.
           CALL 'DOCB0321' USING RUTINAS.
           GOBACK.

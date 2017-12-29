      * SDP DESCRIPTION
      *  DOC - Subrutina
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DOCB0311.


       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  VARIABLES.
           03  CONT0311 PIC 9(03) VALUE ZEROS.

       01  RUTINAS.
           03 DOCB0311  PIC X(08) VALUE 'DOCB0311'.
           03 DOCB0321  PIC X(08) VALUE 'DOCB0321'.
           03 DOCB0322  PIC X(08) VALUE 'DOCB0322'.

       LINKAGE SECTION.
       01  DATOS.
           03 CALLING  PIC X(08).
       
       PROCEDURE DIVISION USING DATOS.
       INICIO.
           ADD 1 TO CONT0311.
           DISPLAY 'EJECUTA DOCB0311 DESDE ' CALLING 
                   ' CON CONTADOR = ' CONT0311.
           MOVE DOCB0311 TO CALLING.
           CALL 'DOCB0321' USING RUTINAS.
           MOVE DOCB0311 TO CALLING.
           CALL 'DOCB0322' USING RUTINAS.
           GOBACK.
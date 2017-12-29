      * SDP DESCRIPTION
      *  DOC - Subrutina
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DOCB0322.


       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  VARIABLES.
           03  CONTADOR PIC 9(03) VALUE ZEROS.

       01  RUTINAS.
           03 DOCB0311  PIC X(08) VALUE 'DOCB0311'.
           03 DOCB0321  PIC X(08) VALUE 'DOCB0321'.
           03 DOCB0322  PIC X(08) VALUE 'DOCB0322'.

       LINKAGE SECTION.
       01  DATOS.
           03 CALLING  PIC X(08).
       
       PROCEDURE DIVISION USING DATOS.
       INICIO.
           ADD 1 TO CONTADOR.
           DISPLAY 'EJECUTA DOCB0322 DESDE ' CALLING 
                   ' CON CONTADOR = ' CONTADOR
           MOVE DOCB0322 TO CALLING.
           CALL DOCB0321 USING DATOS.
           GOBACK.

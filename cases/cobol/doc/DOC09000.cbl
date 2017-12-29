      * SDP DESCRIPTION
      *  DOC - Ejemplo de inyeccion de codigo
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DOCB09000.


       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  VARIABLES.
           03  CONTADOR PIC 9(03) VALUE ZEROS.
           03  CALLED   PIC X(08) VALUE "RUTINA".

       LINKAGE SECTION.
       01  DATOS.
           03 CALLING  PIC X(08).
       
       PROCEDURE DIVISION USING DATOS.
       INICIO.
           ADD 1 TO CONTADOR.
           PERFORM PARRAFO1.
           GOBACK.

       PARRAFO1.

            IF CONTADOR > 1 THEN
                ADD 1 TO CONTADOR
            ELSE
                ADD 1 TO CONTADOR
            END-IF

            CALL CALLED USING VARIABLES

            CALL "DOC09000" USING VARIABLES.

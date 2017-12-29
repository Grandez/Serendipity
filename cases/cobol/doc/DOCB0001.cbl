      * SDP DESCRIPTION
      *  DOC - Demuestra el uso de los niveles en la definicion de
      *>       las variables
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DOCB0001.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  VAR77  PIC X(10) VALUE 'VAR77'.

       01  VAR01.
           03 ABC     PIC X(03)  VALUE 'ABC'.
           03 NIVEL03.
              05 LETRAD   PIC X(01)  VALUE 'D'.
              05 LETRAE   PIC X(01)  VALUE 'E'.
              05 LETRAF   PIC X(01)  VALUE 'F'.

       PROCEDURE DIVISION.
           PERFORM DISPLAY-VARIABLES.
           MOVE SPACES TO NIVEL03.
           DISPLAY 'TRAS INICIAR NIVEL03 A ESPACIOS'.
           PERFORM DISPLAY-VARIABLES.
           STOP RUN.

       DISPLAY-VARIABLES.
           DISPLAY 'VARIABLE VAR77 ES   : ' VAR77.
           DISPLAY 'VARIABLE VAR01 ES   : ' VAR01.
           DISPLAY 'VARIABLE NIVEL03 ES : ' NIVEL03.
           DISPLAY 'VARIABLE LETRAE ES  : ' LETRAE.

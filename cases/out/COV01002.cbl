      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Casos de prueba
      ******************************************************************
      * SDP DESCRIPTION
      *  COV - No satisface la cobertura de codigo parcialmente
      * SDP END

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV01002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'COV01002'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '21B4D0C819B5E632'.
              05 FILLER PIC X(16) VALUE 'A654F91CC41A346E'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 2.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 2 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01 AUX  PIC  9(05) VALUE ZEROS.
       01 IDX  PIC    99  VALUE 1.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'COV01002'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV01002'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.

           CALL TRAP OF S14419951 USING 259 8 S14419951
                'COV01002' 
           STOP RUN.

       PARRAFO-INUTIL.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           MOVE 1 TO AUX.
           MOVE 2 TO AUX.
           MOVE 3 TO AUX.
           MOVE 4 TO AUX.
           MOVE 5 TO AUX.
 

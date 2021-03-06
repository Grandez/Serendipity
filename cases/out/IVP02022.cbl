      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Verificacion de un perform
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de la sacudida o coacktail sort
      *  Version mejorada detectando cuando el fichero ya esta ordenado
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01022.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP01022'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '653EC790CB284585'.
              05 FILLER PIC X(16) VALUE 'E8B4712533F05565'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 3.
              05 NPAR BINARY-LONG VALUE 3.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 3 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 4  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01  VARS.
           03  VECES        PIC  9(05) VALUE 1.
           03  WC-START     PIC  9(05) VALUE 1.
           03  WC-END       PIC  9(01) VALUE 1.
           03  WC-TEMP      PIC  9(05) VALUE ZEROS.
           03  WC-DIRECTION PIC S9(01) VALUE 1.
           03  WC-LAST-CHANGE PIC 9(05) VALUE ZEROS.
           03  CAMBIO       PIC 9(01) VALUE 1.
       
       01  INDICES.
           03  IDX  PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       01 RUTINAS.
          03 CARGA    PIC X(08) VALUE "SRTMLOAD".
          03 DESCARGA PIC X(08) VALUE "SRTMWRIT".
          
       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP01022'.
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01022'
           GOBACK.
       INICIO.

           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14419951 USING 260 8 S14419951
                'E-SHAKER' 
            PERFORM E-SHAKER
                   UNTIL WC-END * WC-DIRECTION <
                         WC-START * WC-DIRECTION
                   OR    CAMBIO = 0
           CALL TRAP OF S14419951 USING 261 8 S14419951
                'E-SHAKER' 
                                   .


           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP01022' 
           STOP RUN.


       E-SHAKER.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           MOVE ZEROS TO CAMBIO.
           CALL TRAP OF S14419951 USING 260 6 S14419951
                'F-PASS' 
           PERFORM F-PASS VARYING IDX FROM WC-START BY WC-DIRECTION
                          UNTIL IDX = WC-END + WC-DIRECTION
           CALL TRAP OF S14419951 USING 261 6 S14419951
                'F-PASS' 
                                                           .
 
           MOVE WC-START TO WC-END.
           SUBTRACT WC-DIRECTION FROM WC-LAST-CHANGE GIVING WC-START.
           MULTIPLY WC-DIRECTION BY -1 GIVING WC-DIRECTION.
 
       F-PASS.


           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
              SET  WC-LAST-CHANGE TO IDX.
 

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de SELECCION
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBSEL0.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTBSEL0'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '65C003D1319085BB'.
              05 FILLER PIC X(16) VALUE '635A5906A275A40D'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 8.
              05 NPAR BINARY-LONG VALUE 4.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 8 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 5  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01  DATA-SORT. 
       COPY SRTWDATA.
       
       01  VARS.
           03  VECES        PIC  9(05) VALUE 1.
           03  WC-START     PIC  9(05) VALUE 1.
           03  WC-END       PIC  9(01) VALUE 1.
           03  WC-TEMP      PIC  9(05) VALUE ZEROS.
           03  WC-DIRECTION PIC S9(01) VALUE 1.
           03  WC-LAST-CHANGE PIC 9(05) VALUE ZEROS.
           03  WC-LOWEST      PIC 9(05) VALUE ZEROS.
       
       01  INDICES.
           03  IDX  PIC 9(05) VALUE 1.
           03  IDX2 PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       01 RUTINAS.
          03 CARGA    PIC X(08) VALUE "SRTMLOAD".
          03 DESCARGA PIC X(08) VALUE "SRTMWRIT".
          
       PROCEDURE DIVISION.
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTBSEL0'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBSEL0'
           GOBACK.
       INICIO.

      *    ACCEPT VECES FROM ARGUMENT-VALUE

           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           CALL TRAP OF S14420521 USING 264 LENGTH OF CARGA S14420521
                CARGA 
           CALL CARGA USING DATA-SORT
           CALL TRAP OF S14420521 USING 265 LENGTH OF CARGA S14420521
                CARGA 
                                     . 

           CALL TRAP OF S14420521 USING 260 7 S14420521
                'ORDENAR' 
           PERFORM ORDENAR VECES TIMES
           CALL TRAP OF S14420521 USING 261 7 S14420521
                'ORDENAR' 
                                      .

           CALL TRAP OF S14420521 USING 264 LENGTH OF DESCARGA S14420521
                DESCARGA 
           CALL DESCARGA USING DATA-SORT
           CALL TRAP OF S14420521 USING 265 LENGTH OF DESCARGA S14420521
                DESCARGA 
                                        .

           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBSEL0' 
           STOP RUN.

       ORDENAR.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           CALL TRAP OF S14420521 USING 260 11 S14420521
                'E-SELECTION' 
            PERFORM E-SELECTION VARYING IDX FROM 1 BY 1
                               UNTIL IDX = ITEMS
           CALL TRAP OF S14420521 USING 261 11 S14420521
                'E-SELECTION' 
                                                .
 
       E-SELECTION.

           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
           SET WC-LOWEST   TO IDX.
           ADD 1 WC-LOWEST GIVING WC-START
 
           CALL TRAP OF S14420521 USING 260 6 S14420521
                'F-PASS' 
           PERFORM F-PASS VARYING IDX2 FROM WC-START BY 1
                          UNTIL IDX2 > ITEMS
           CALL TRAP OF S14420521 USING 261 6 S14420521
                'F-PASS' 
                                            .
 
           IF IDX NOT = WC-LOWEST
           MOVE 1 TO COB(4) 
              MOVE ORDEN(WC-LOWEST) TO WC-TEMP
              MOVE ORDEN(IDX)   TO ORDEN(WC-LOWEST)
              MOVE WC-TEMP             TO ORDEN(IDX)
           END-IF
           MOVE 1 TO COB(5)
                                                    .
 
       F-PASS.

           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(6) 
           IF ORDEN(IDX2) < ORDEN(WC-LOWEST)
           MOVE 1 TO COB(7) 
              SET WC-LOWEST TO IDX2
           END-IF
           MOVE 1 TO COB(8)
                                   .
 
 

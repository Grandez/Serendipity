      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de la sacudida o coacktail sort
      *  Version mejorada detectando cuando el fichero ya esta ordenado
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBSOC1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTBSOC1'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '4B973A2AF5C5E713'.
              05 FILLER PIC X(16) VALUE '16B029E63E7963EF'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 6.
              05 NPAR BINARY-LONG VALUE 4.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 6 TIMES PIC 9(01) VALUE ZEROS.
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
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTBSOC1'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBSOC1'
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
                'SRTBSOC1' 
           STOP RUN.

       ORDENAR.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           MOVE 2       TO WC-START
           MOVE ITEMS TO WC-END.
           MOVE 1       TO WC-DIRECTION
                           WC-LAST-CHANGE.
                           
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'E-SHAKER' 
           PERFORM E-SHAKER 
                   UNTIL WC-END * WC-DIRECTION <
                         WC-START * WC-DIRECTION
                   OR    CAMBIO = 0
           CALL TRAP OF S14420521 USING 261 8 S14420521
                'E-SHAKER' 
                                   .      
 
 
       E-SHAKER.
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
           MOVE ZEROS TO CAMBIO.
           CALL TRAP OF S14420521 USING 260 6 S14420521
                'F-PASS' 
           PERFORM F-PASS VARYING IDX FROM WC-START BY WC-DIRECTION
                          UNTIL IDX = WC-END + WC-DIRECTION
           CALL TRAP OF S14420521 USING 261 6 S14420521
                'F-PASS' 
                                                           .
 
           MOVE WC-START TO WC-END.
           SUBTRACT WC-DIRECTION FROM WC-LAST-CHANGE GIVING WC-START.
           MULTIPLY WC-DIRECTION BY -1 GIVING WC-DIRECTION.
 
       F-PASS.

           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(4) 
           IF ORDEN(IDX - 1) > ORDEN(IDX)
           MOVE 1 TO COB(5) 
              SET  WC-LAST-CHANGE TO IDX
              MOVE ORDEN(IDX - 1) TO WC-TEMP
              MOVE ORDEN(IDX)     TO ORDEN(IDX - 1)
              MOVE WC-TEMP        TO ORDEN(IDX)
              MOVE 1              TO CAMBIO
           END-IF
           MOVE 1 TO COB(6)
                                           .
 
 

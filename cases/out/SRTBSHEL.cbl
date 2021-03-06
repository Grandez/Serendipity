      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo SHELL
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBSHEL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTBSHEL'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '1DE5567CB277BCEC'.
              05 FILLER PIC X(16) VALUE '73DF9FDC083590AD'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 7.
              05 NPAR BINARY-LONG VALUE 5.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 7 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 6  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       01  DATA-SORT. 
       COPY SRTWDATA.
       
       01  VARS.
           03  VECES        PIC  9(05) VALUE 1.
           03  WC-START     PIC  9(05) VALUE 1.
           03  WC-END       PIC  9(01) VALUE 1.
           03  WC-GAP       PIC  9(05) VALUE ZEROS.
           03  WC-TEMP      PIC  9(05) VALUE ZEROS.
           03  WC-DIRECTION PIC S9(01) VALUE 1.
           03  WC-LAST-CHANGE PIC 9(05) VALUE ZEROS.
       
       01  INDICES.
           03  IDX   PIC 9(05) VALUE 1.
           03  IDX2  PIC 9(05) VALUE 1.
           03  IDX3  PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       01 RUTINAS.
          03 CARGA    PIC X(08) VALUE "SRTMLOAD".
          03 DESCARGA PIC X(08) VALUE "SRTMWRIT".
          
       PROCEDURE DIVISION.
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTBSHEL'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBSHEL'
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
                'SRTBSHEL' 
           STOP RUN.

       ORDENAR.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           DIVIDE ITEMS BY 2 GIVING WC-GAP.

           CALL TRAP OF S14420521 USING 260 13 S14420521
                'E-PROCESS-GAP' 
           PERFORM E-PROCESS-GAP UNTIL WC-GAP = 0

           CALL TRAP OF S14420521 USING 261 13 S14420521
                'E-PROCESS-GAP' 
           .
           
       E-PROCESS-GAP.

           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(3) 
           CALL TRAP OF S14420521 USING 260 11 S14420521
                'F-SELECTION' 
           PERFORM F-SELECTION VARYING IDX FROM WC-GAP BY 1
                               UNTIL IDX > ITEMS
           CALL TRAP OF S14420521 USING 261 11 S14420521
                'F-SELECTION' 
                                                .
 
           DIVIDE WC-GAP BY 2.2 GIVING WC-GAP.
 
       F-SELECTION.
      
           ADD  1 TO PAR(4) 
           MOVE 1 TO COB(4) 
           SET IDX2            TO IDX.
           MOVE ORDEN(IDX) TO WC-TEMP.
 
           SET IDX3 TO IDX2.
           SET IDX3 DOWN BY WC-GAP.
           CALL TRAP OF S14420521 USING 260 6 S14420521
                'G-PASS' 
           PERFORM G-PASS UNTIL IDX2 NOT > WC-GAP
      * The next line logically reads :
      *                   or ITEMS(IDX2 - wc-gap) not > wc-temp.
                          OR ORDEN(IDX3) NOT > WC-TEMP
           CALL TRAP OF S14420521 USING 261 6 S14420521
                'G-PASS' 
                                                      .
 
           IF IDX NOT = IDX2
           MOVE 1 TO COB(5) 
              MOVE WC-TEMP TO ORDEN(IDX2)
           END-IF
           MOVE 1 TO COB(6)
                                         .
 
       G-PASS.
      * Note that IDX3 is WC-GAP less than IDX2.
      * Logically this should be :
      *    move ITEMS(IDX2 - wc-gap) to ITEMS(IDX2).
      *    set IDX2 down by wc-gap.
      * Unfortunately ITEMS(IDX2 - wc-gap) is not legal in C2 cobol

           ADD  1 TO PAR(5) 
           MOVE 1 TO COB(7) 
           MOVE ORDEN(IDX3) TO ORDEN(IDX2).
           SET IDX2            DOWN BY WC-GAP.
           SET IDX3            DOWN BY WC-GAP.
 

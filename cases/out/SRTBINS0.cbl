      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por insercion
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBINS0.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTBINS0'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '208C76CD1E038354'.
              05 FILLER PIC X(16) VALUE '21807B0CBBB4C83D'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 7.
              05 NPAR BINARY-LONG VALUE 3.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 7 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 4  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       
       01  DATA-SORT.
       COPY SRTWDATA.
       
       01  VARS.
           03  VECES    PIC 9(05) VALUE 1.
           03  TEMP   PIC 9(05) VALUE ZEROS.
           
       01  INDICES.
           03  IDX   PIC 9(05) VALUE 1.
           03  IDX2  PIC 9(05) VALUE 1.
           03  MIN   PIC 9(05).
           03  MAX   PIC 9(05).
           03  AUX   PIC 9(05).

       01 RUTINAS.
          03 CARGA    PIC X(08) VALUE "SRTMLOAD".
          03 DESCARGA PIC X(08) VALUE "SRTMWRIT".
          
       PROCEDURE DIVISION.
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTBINS0'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBINS0'
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
                'SRTBINS0' 
           STOP RUN.

       ORDENAR.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > ITEMS
           MOVE 1 TO COB(3) 
              MOVE ORDEN(IDX) TO TEMP
              SET IDX2 TO IDX
 
           CALL TRAP OF S14420521 USING 260 5 S14420521
                'PASAR' 
              PERFORM PASAR UNTIL IDX2 NOT > 1 
                            OR    TEMP NOT < ORDEN(IDX2 - 1)

           CALL TRAP OF S14420521 USING 261 5 S14420521
                'PASAR' 
              IF IDX NOT = IDX2
           MOVE 1 TO COB(4) 
                 MOVE TEMP TO ORDEN(IDX2)
              END-IF

           MOVE 1 TO COB(5) 
           END-PERFORM
           MOVE 1 TO COB(6) 
                      .

       PASAR.
      
           ADD  1 TO PAR(3) 
           MOVE 1 TO COB(7) 
           MOVE ORDEN(IDX2 - 1) TO ORDEN(IDX2).
           SET IDX2                DOWN BY 1.
 

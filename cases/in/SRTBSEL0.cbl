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
       INICIO.

      *    ACCEPT VECES FROM ARGUMENT-VALUE

           CALL CARGA USING DATA-SORT. 

           PERFORM ORDENAR VECES TIMES.

           CALL DESCARGA USING DATA-SORT.

           STOP RUN.

       ORDENAR.

            PERFORM E-SELECTION VARYING IDX FROM 1 BY 1
                               UNTIL IDX = ITEMS.
 
       E-SELECTION.

           SET WC-LOWEST   TO IDX.
           ADD 1 WC-LOWEST GIVING WC-START
 
           PERFORM F-PASS VARYING IDX2 FROM WC-START BY 1
                          UNTIL IDX2 > ITEMS.
 
           IF IDX NOT = WC-LOWEST
              MOVE ORDEN(WC-LOWEST) TO WC-TEMP
              MOVE ORDEN(IDX)   TO ORDEN(WC-LOWEST)
              MOVE WC-TEMP             TO ORDEN(IDX).
 
       F-PASS.

           IF ORDEN(IDX2) < ORDEN(WC-LOWEST)
              SET WC-LOWEST TO IDX2.
 

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
       INICIO.

      *    ACCEPT VECES FROM ARGUMENT-VALUE

           CALL CARGA USING DATA-SORT. 

           PERFORM ORDENAR VECES TIMES.

           CALL DESCARGA USING DATA-SORT.

           STOP RUN.

       ORDENAR.

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > ITEMS
              MOVE ORDEN(IDX) TO TEMP
              SET IDX2 TO IDX
 
              PERFORM PASAR UNTIL IDX2 NOT > 1 
                            OR    TEMP NOT < ORDEN(IDX2 - 1)

              IF IDX NOT = IDX2
                 MOVE TEMP TO ORDEN(IDX2)
              END-IF

           END-PERFORM.

       PASAR.
      
           MOVE ORDEN(IDX2 - 1) TO ORDEN(IDX2).
           SET IDX2                DOWN BY 1.

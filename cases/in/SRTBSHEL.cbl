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
       INICIO.

      *    ACCEPT VECES FROM ARGUMENT-VALUE

           CALL CARGA USING DATA-SORT. 

           PERFORM ORDENAR VECES TIMES.

           CALL DESCARGA USING DATA-SORT.

           STOP RUN.

       ORDENAR.

           DIVIDE ITEMS BY 2 GIVING WC-GAP.

           PERFORM E-PROCESS-GAP UNTIL WC-GAP = 0

           .
           
       E-PROCESS-GAP.

           PERFORM F-SELECTION VARYING IDX FROM WC-GAP BY 1
                               UNTIL IDX > ITEMS.
 
           DIVIDE WC-GAP BY 2.2 GIVING WC-GAP.
 
       F-SELECTION.
      
           SET IDX2            TO IDX.
           MOVE ORDEN(IDX) TO WC-TEMP.
 
           SET IDX3 TO IDX2.
           SET IDX3 DOWN BY WC-GAP.
           PERFORM G-PASS UNTIL IDX2 NOT > WC-GAP
      * The next line logically reads :
      *                   or ITEMS(IDX2 - wc-gap) not > wc-temp.
                          OR ORDEN(IDX3) NOT > WC-TEMP.
 
           IF IDX NOT = IDX2
              MOVE WC-TEMP TO ORDEN(IDX2).
 
       G-PASS.
      * Note that IDX3 is WC-GAP less than IDX2.
      * Logically this should be :
      *    move ITEMS(IDX2 - wc-gap) to ITEMS(IDX2).
      *    set IDX2 down by wc-gap.
      * Unfortunately ITEMS(IDX2 - wc-gap) is not legal in C2 cobol

           MOVE ORDEN(IDX3) TO ORDEN(IDX2).
           SET IDX2            DOWN BY WC-GAP.
           SET IDX3            DOWN BY WC-GAP.

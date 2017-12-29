      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de la burbuja
      *  Version basica en un parrafo
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBBB10.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  DATA-SORT. 
       COPY SRTWDATA.

       01  INDICES.
           03  IDX  PIC 9(05) VALUE 1.
           03  MIN  PIC 9(05).
           03  MAX  PIC 9(05).
           03  AUX  PIC 9(05).

       01 RUTINAS.
          03 CARGA    PIC X(08) VALUE "SRTMLOAD".
          03 DESCARGA PIC X(08) VALUE "SRTMWRIT".
          
       PROCEDURE DIVISION.
       INICIO.

           CALL CARGA USING DATA-SORT. 

           PERFORM ORDENAR.

           CALL DESCARGA USING DATA-SORT.

           STOP RUN.

       ORDENAR.

           COMPUTE MAX = ITEMS

           PERFORM VARYING MAX FROM MAX BY -1 UNTIL MAX = 1
                   MOVE 1 TO IDX
                   PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX  = MAX
                           IF ORDEN(IDX) > ORDEN (IDX + 1)
                              MOVE ORDEN(IDX + 1) TO AUX
                              MOVE ORDEN(IDX) TO ORDEN(IDX + 1)
                              MOVE AUX TO ORDEN(IDX)
                          END-IF
                  END-PERFORM
           END-PERFORM.

      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Ordenacion por la burbuja
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de la burbuja optimizado
      *  Identifica cuando el fichero ya ha sido ordenado
      *  Version de un parrafo
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRTBBB20.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  DATA-SORT. 
       COPY SRTWDATA.
       
       01  VARS.
           03  CAMBIO   PIC 9(01) VALUE 1.

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

           MOVE    1 TO CAMBIO
           
           PERFORM VARYING MAX FROM ITEMS BY -1 
                   UNTIL MAX = 1
                   OR    CAMBIO = 0

               MOVE 0 TO CAMBIO
               PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX  = MAX
                   IF ORDEN(IDX) > ORDEN (IDX + 1)
                      MOVE ORDEN(IDX + 1) TO AUX
                      MOVE ORDEN(IDX) TO ORDEN(IDX + 1)
                      MOVE AUX TO ORDEN(IDX)
                      MOVE 1   TO CAMBIO
                   END-IF
              END-PERFORM
           END-PERFORM.

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
       01  S14420521.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SRTBBB10'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '10B0E5DB3D549B5D'.
              05 FILLER PIC X(16) VALUE '5E98FE27A575EF3C'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 8.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 8 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

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
           CALL TRAP OF S14420521 USING 258 8 S14420521
                'SRTBBB10'.
           CALL TRAP OF S14420521 USING 260 8 S14420521
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14420521 USING 259 8 S14420521
                'SRTBBB10'
           GOBACK.
       INICIO.

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
           PERFORM ORDENAR
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
                'SRTBBB10' 
           STOP RUN.

       ORDENAR.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           COMPUTE MAX = ITEMS

           PERFORM VARYING MAX FROM MAX BY -1 UNTIL MAX = 1
           MOVE 1 TO COB(3) 
                   MOVE 1 TO IDX
                   PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX  = MAX
           MOVE 1 TO COB(4) 
                           IF ORDEN(IDX) > ORDEN (IDX + 1)
           MOVE 1 TO COB(5) 
                              MOVE ORDEN(IDX + 1) TO AUX
                              MOVE ORDEN(IDX) TO ORDEN(IDX + 1)
                              MOVE AUX TO ORDEN(IDX)
                          END-IF
           MOVE 1 TO COB(6) 
                  END-PERFORM
           MOVE 1 TO COB(7) 
           END-PERFORM
           MOVE 1 TO COB(8) 
                      .
 

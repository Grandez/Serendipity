      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   04/2015
      * Purpose: Verificacion de un perform
      ******************************************************************
      * SDP DESCRIPTION
      *  Ordenacion por el metodo de la sacudida o coacktail sort
      *  Version mejorada detectando cuando el fichero ya esta ordenado
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP01022.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
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
       INICIO.

            PERFORM E-SHAKER
                   UNTIL WC-END * WC-DIRECTION <
                         WC-START * WC-DIRECTION
                   OR    CAMBIO = 0.


           STOP RUN.


       E-SHAKER.
           MOVE ZEROS TO CAMBIO.
           PERFORM F-PASS VARYING IDX FROM WC-START BY WC-DIRECTION
                          UNTIL IDX = WC-END + WC-DIRECTION.
 
           MOVE WC-START TO WC-END.
           SUBTRACT WC-DIRECTION FROM WC-LAST-CHANGE GIVING WC-START.
           MULTIPLY WC-DIRECTION BY -1 GIVING WC-DIRECTION.
 
       F-PASS.


              SET  WC-LAST-CHANGE TO IDX.

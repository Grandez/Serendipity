      *> SDP DESC Grafo PERFORM UNTIL
      *> SDP IVP 0 SDPAnalyzer.getRC = 0 - Grafo IF simple

       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRF00021.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM 000-INICIO.
           PERFORM 010-PROCESO UNTIL NUM01 > 5
           PERFORM 999-FIN.
           
       000-INICIO.
           ADD 1 TO NUM01.
           
       010-PROCESO.
           ADD 1 TO NUM01.

       PROCESO-1.
           ADD 1 TO NUM01.

       PROCESO-2.
           ADD 1 TO NUM01.
           
       999-FIN.
           GOBACK.

 
        
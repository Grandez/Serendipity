      *> SDP DESC Grafo EVALUATE END-EVALUATE simple 
      *> SDP IVP 0 Graph.NumGraphs = 1 - Grafo EVALUATE END-EVALUATE simple 
      *> SDP IVP 0 Graph.NumNodes  = 7 


       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRF00030.
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
           EVALUATE NUM01
              WHEN 1  ADD 1 TO NUM02
              WHEN 2  ADD 2 TO NUM02
              WHEN 3  ADD 1 TO NUM02
           END-EVALUATE   
           GOBACK.

 
       
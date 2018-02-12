      *> SDP DESC Grafo EVALUATE - OTHER - END-EVALUATE simple 
      *> SDP IVP 0 Graph.numGraphs = 1 - Grafo EVALUATE - OTHER - END-EVALUATE simple 
      *> SDP IVP 0 Graph.NumNodes  = 8 - Grafo EVALUATE - OTHER - END-EVALUATE simple 


       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRF00031.
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
              WHEN 1     ADD 1 TO NUM02
              WHEN 2     ADD 2 TO NUM02
              WHEN 3     ADD 3 TO NUM02
              WHEN OTHER ADD 4 TO NUM02 
           END-EVALUATE   
           GOBACK.

 
        
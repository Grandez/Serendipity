      *> SDP DESC Grafo CALL Recursivo estatico
      *> SDP IVP 0 SDPAnalyzer.getRC = 0 - CALL Recursivo estatico

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARB06100.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       LINKAGE SECTION.

       01 DFHCOMMAREA PIC X(100).

       PROCEDURE DIVISION.
           ADD 1 TO NUM01. 
           
           IF NUM01 > 3 CALL 'ARB06000'.
          
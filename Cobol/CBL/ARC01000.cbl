      *> SDP DESC Arbol LINK Estatico
      *> SDP IVP 0 Calls.Count = 1 - LINK Estatico

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARC01000.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
           ADD 1 TO NUM01.
           EXEC CICS
              LINK PROGRAM('ARC01100').
           END-EXEC. 
           
                       
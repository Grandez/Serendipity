      *> SDP DESC Arbol LINK Dinamico simple
      *> SDP IVP 0 Calls.Count = 1 - LINK Dinamico simple

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARC02000.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  RUTS.
           03 LNK-ARC02100 PIC X(08) VALUE 'ARC02100'.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
           ADD 1 TO NUM01.
           EXEC CICS
              LINK PROGRAM(LNK-ARC02100).
           END-EXEC. 
           
                      
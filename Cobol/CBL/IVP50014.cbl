      *> SDP DESC Tratamiento de comentarios
      *> SDP IVP 0 Issues.getCount = 1 - Asterisco aislado en CODE
      *> SDP IVP 2 Issues.getCount = 0 - Anulacion asterisco a nivel Rule

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP50014.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
      * 
           COMPUTE NUM03 = NUM01 + NUM02.
           GOBACK.

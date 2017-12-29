      *> SDP DESC IVP SKIP en CODE
      *> SDP IVP 0 Issues.getCount = 1 - Directiva SKIP
      *> SDP IVP 1 Issues.getCount = 0 - Anulacion SKIP a nivel Item      
      *> SDP IVP 2 Issues.getCount = 0 - Anulacion SKIP a nivel Rule

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP50027.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/01
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.
       
       PROCEDURE DIVISION.
       SKIP3  
           COMPUTE NUM03 = NUM01 + NUM02.
           GOBACK.

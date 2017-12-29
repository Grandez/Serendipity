       CBL LIST COSAS
      *> SDP DESC Directivas de compilacion varias
      *> SDP IVP 0 Issues.getCount = 3 - Directivas compilacion

       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP50029.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       EJECT 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
       INICIO.
           COMPUTE NUM03 = NUM01 + NUM02.
           GOBACK.
       SKIP3    

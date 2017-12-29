      *> SDP DESC TABS en varios sitios
      *> SDP IVP 0 Issues.getCount = 3 - Caracteres de tabulacion
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP50003.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01	PIC	9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
           COMPUTE NUM03 =	NUM01 + NUM02.
           GOBACK.

      *> SDP DESC CONFIGURATION-SECTION OBJECT-COMPUTER
      *> SDP IVP 0 Issues.Count = 1 - OBJECT-COMPUTER

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP51002.
       AUTHOR.        USRIVP0 - SERENDIPITY

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       OBJECT-COMPUTER. ZOS.
       
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
    
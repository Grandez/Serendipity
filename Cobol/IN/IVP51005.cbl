      *> SDP DESC CONFIGURATION SECTION Multilines
      *> SDP IVP 0 Issues.Count = 1 - Multilines

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP51005.
       AUTHOR.        USRIVP0 - SERENDIPITY

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT 
                          IS COMMA.
       
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
      
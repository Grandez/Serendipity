      *> SDP DESC Sin autor
      *> SDP IVP 0 Issues.getCount = 1 - Sin autor

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    IVP50031.
      *AUTHOR.        USRIVP0 - SERENDIPITY
      *INSTALLATION.  PRUEBAS
      *DATE-WRITTEN.  01/01/01
       DATE-COMPILED. 01/01/01
      *SECURITY.      DATOS SEGURIDAD

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
 
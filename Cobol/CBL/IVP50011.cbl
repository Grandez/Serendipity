                 
      *> SDP DESC Comentarios normales
      *> SDP IVP 0 Issues.getCount = 1 - Comentarios con D
      *> SDP IVP 2 Issues.getCount = 0 - Anulacion D a nivel Rule
      
      D Este es un comentario
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP50011.
       AUTHOR. USRIVP0 - IVP
       DATE-COMPILED. 01/01/2001

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DATOS.
           03 NUM01 PIC 9(03) VALUE ZEROS.
           03 NUM02 PIC 9(03) VALUE 1.
           03 NUM03 PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
           COMPUTE NUM03 = NUM01 + NUM02.
           GOBACK.

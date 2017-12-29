      *****************************************************************
      * COPY de traspaso en el arbol de llamadas
      *
      *****************************************************************

           03 MAX-DEPTH   PIC 9(03).
           03 CURR-DEPTH  PIC 9(03).
           03 TB-DEPTH  OCCURS 10 TIMES PIC 9(03) VALUE ZEROS.
           03 CURR-ARBOL  PIC 9(02).
           03 RUTINA.
              05 BASE     PIC X(6) VALUE 'ARBM00'.
              05 IDRUTINA PIC 9(2) VALUE ZEROS.

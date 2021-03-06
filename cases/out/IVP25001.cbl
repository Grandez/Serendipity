      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   07/2015
      * Purpose: Verificar el proceso de llamadas a modulos no monitori
      ******************************************************************
      * SDP DESCRIPTION
      *   Programa sintetico para verificar la llamada a modulos
      *>  no monitorizados
      *         
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IVP25001.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14419951.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'IVP25001'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'BF3C0A12C4397C46'.
              05 FILLER PIC X(16) VALUE '89D893357B98D270'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 1.
              05 NPAR BINARY-LONG VALUE 1.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 1 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 2  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419951 USING 258 8 S14419951
                'IVP25001'.
           MOVE 1 TO COB(1) 
              DISPLAY 'INICIO IVP25001'
           CALL TRAP OF S14419951 USING 264 16 S14419951
                'CBL_OC_NANOSLEEP' 
              CALL "CBL_OC_NANOSLEEP" USING 1000
           CALL TRAP OF S14419951 USING 265 16 S14419951
                'CBL_OC_NANOSLEEP' 
           CALL TRAP OF S14419951 USING 264 16 S14419951
                'CBL_OC_NANOSLEEP' 
              CALL "CBL_OC_NANOSLEEP" USING 2000
           CALL TRAP OF S14419951 USING 265 16 S14419951
                'CBL_OC_NANOSLEEP' 
              DISPLAY 'FIN    IVP25001'
           CALL TRAP OF S14419951 USING 259 8 S14419951
                'IVP25001' 
              STOP RUN. 
 

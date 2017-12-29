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


       PROCEDURE DIVISION.
              DISPLAY 'INICIO IVP25001'
              CALL "CBL_OC_NANOSLEEP" USING 1000
              CALL "CBL_OC_NANOSLEEP" USING 2000
              DISPLAY 'FIN    IVP25001'
              STOP RUN. 

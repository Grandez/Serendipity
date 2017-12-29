      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   07/2015
      * Purpose: Generar un arbol de llamadas entre rutinas
      ******************************************************************
      * SDP DESCRIPTION
      *   Programa sintetico para generar una estructura de arbol
      *>  de llamadas entre modulos para emular un sistema real
      *       
      * El programa decide pseudoaleatoriamente la profundidad del
      *> arbol de llamadas y el numero de rutinas a llamar
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARBB0001.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ARB-DATA.
       COPY ARBWDATA.

       01  DATETIME.
           03 TMS.
              05 CDT-Year PIC 9(4).
              05 CDT-Month PIC 9(2).
              05 CDT-Day PIC 9(2).
              05 CDT-Hour PIC 9(2).
              05 CDT-Minutes PIC 9(2).
              05 CDT-Seconds PIC 9(2).
              05 CDT-Hundredths-Of-Secs PIC 9(2).
           03 RESTO-TMS.
              05 CDT-GMT-Diff-Hours PIC S9(2) SIGN LEADING SEPARATE.
              05 CDT-GMT-Diff-Minutes PIC 9(2).

       01  AUXILIAR.
           03  SEMILLA PIC 9(18).
           03  ENTERO  PIC 9(18).
           03  RESTO   PIC 9(03).
           03  CAMPO1  PIC 9(18).
           03  CAMPO2  PIC 9(18).

       01  TRABAJO.
           03 RUTINAS PIC 9(02).
           03 IDX     PIC 9(06).
           03 IARBOL  PIC 9(03).
           03 BUCLE   PIC 9(09).

       PROCEDURE DIVISION.
       INICIO.

           DISPLAY 'ARBB0001'.
           
           MOVE FUNCTION CURRENT-DATE TO  DATETIME.

      * CALCULAR EL NUMERO DE RUTINAS QUE SE LLAMARAN

           COMPUTE SEMILLA = FUNCTION RANDOM(TMS) * 1000000
           DIVIDE SEMILLA BY 5 GIVING ENTERO REMAINDER RESTO.
           COMPUTE RUTINAS = RESTO + 1

      * CALCULAR LA PROFUNDIDAD DE CADA RAMA

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > RUTINAS
              COMPUTE SEMILLA = FUNCTION RANDOM * 1000000000
              DIVIDE SEMILLA BY 15 GIVING ENTERO REMAINDER RESTO
              MOVE RESTO TO TB-DEPTH(IDX)
           END-PERFORM.

           PERFORM PROCESO VARYING IARBOL FROM 1 BY 1
                           UNTIL IARBOL > RUTINAS.

           GOBACK.

       PROCESO.

           MOVE ZEROS TO CAMPO1.
           MOVE ZEROS TO CAMPO2.

           COMPUTE BUCLE = FUNCTION RANDOM * 1000

      * SUMAR Y RESTAR DATOS A LOS CAMPOS DE TRABAJO Y
      * HACER UN SLEEP
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX = BUCLE
               DIVIDE IDX BY 5 GIVING ENTERO REMAINDER RESTO

               EVALUATE RESTO
                  WHEN 0  ADD 1 TO CAMPO1
                  WHEN 1  ADD 1 TO CAMPO2
                  WHEN 2  SUBTRACT 1 FROM CAMPO1
                  WHEN 3  SUBTRACT 1 FROM CAMPO2
                  WHEN 4  COMPUTE SEMILLA = FUNCTION RANDOM * 1000
                          COMPUTE SEMILLA = SEMILLA * 10
                          CALL "CBL_OC_NANOSLEEP" USING SEMILLA
              END-EVALUATE

           END-PERFORM.

           COMPUTE SEMILLA = FUNCTION RANDOM * 100000.
           DIVIDE SEMILLA BY 25 GIVING ENTERO REMAINDER IDRUTINA
           MOVE IARBOL TO CURR-ARBOL.

           CALL RUTINA USING ARB-DATA.
           SUBTRACT 1 FROM CURR-DEPTH.

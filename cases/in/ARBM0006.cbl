      ******************************************************************
      * Author: Javier Gonzalez
      * Date:   07/2015
      * Purpose: Generar un arbol de llamadas entre rutinas
      ******************************************************************
      * SDP DESCRIPTION
      *   Rutina sintetica para generar una estructura de arbol
      *>  de llamadas entre modulos para emular un sistema real
      *    
      * El programa principal decide la profundidad del arbol
      * Cada una de estas rutinas verifica si se ha llegado y si no
      *> realiza su correspondiente grupo de llamadas
      * SDP END
      ******************************************************************
               
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARBM0006.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

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
           03  SP      PIC X(64) VALUE SPACES.       
           03  SEMILLA PIC 9(18).
           03  ENTERO  PIC 9(18).
           03  RESTO   PIC 9(03).
           03  CAMPO1  PIC 9(18).
           03  CAMPO2  PIC 9(18).

       01  TRABAJO.
           03 RUTINAS PIC 9(02).
           03 IDX     PIC 9(06).
           03 BUCLE   PIC 9(09).

       LINKAGE SECTION.
       01  ARB-DATA.
       COPY ARBWDATA.

       PROCEDURE DIVISION USING ARB-DATA.
       INICIO.
           ADD 1 TO CURR-DEPTH

           COMPUTE ENTERO = CURR-DEPTH * 3
           DISPLAY SP(1:ENTERO) 'ARBM0006'
           
           PERFORM PROCESO.

           GOBACK.

       PROCESO.

           MOVE ZEROS TO CAMPO1.
           MOVE ZEROS TO CAMPO2.

           COMPUTE BUCLE = FUNCTION RANDOM * 100

      * SUMAR Y RESTAR DATOS A LOS CAMPOS DE TRABAJO Y
      * HACER UN SLEEP
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX = BUCLE
               DIVIDE IDX BY 5 GIVING ENTERO REMAINDER RESTO

               EVALUATE RESTO
                  WHEN 0  ADD 1 TO CAMPO1
                  WHEN 1  ADD 1 TO CAMPO2
                  WHEN 2  SUBTRACT 1 FROM CAMPO1
                  WHEN 3  SUBTRACT 1 FROM CAMPO2
                  WHEN 4  COMPUTE SEMILLA = FUNCTION RANDOM * 1000000
                          COMPUTE SEMILLA = SEMILLA * 100
                          CALL "CBL_OC_NANOSLEEP" USING SEMILLA
              END-EVALUATE

           END-PERFORM.

           COMPUTE SEMILLA = FUNCTION RANDOM * 100000.
           DIVIDE SEMILLA BY 25 GIVING ENTERO REMAINDER IDRUTINA

           IF CURR-DEPTH < TB-DEPTH(CURR-ARBOL)
              CALL RUTINA USING ARB-DATA
              SUBTRACT 1 FROM CURR-DEPTH
           END-IF.

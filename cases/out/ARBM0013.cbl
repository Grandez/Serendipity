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
       PROGRAM-ID. ARBM0013.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  S14421338.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'ARBM0013'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE '5AC0F9879BDBF902'.
              05 FILLER PIC X(16) VALUE '7FBE28F4D2CE4840'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 12.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 0.
           03 COB OCCURS 12 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 1 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.


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
           CALL TRAP OF S14421338 USING 258 8 S14421338
                'ARBM0013'.
           CALL TRAP OF S14421338 USING 260 8 S14421338
                'INICIO'
           PERFORM INICIO
           CALL TRAP OF S14421338 USING 259 8 S14421338
                'ARBM0013'
           GOBACK.
       INICIO.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO CURR-DEPTH

           COMPUTE ENTERO = CURR-DEPTH * 3
           DISPLAY SP(1:ENTERO) 'ARBM0013'
           
           CALL TRAP OF S14421338 USING 260 7 S14421338
                'PROCESO' 
           PERFORM PROCESO
           CALL TRAP OF S14421338 USING 261 7 S14421338
                'PROCESO' 
                          .

           CALL TRAP OF S14421338 USING 259 8 S14421338
                'ARBM0013' 
           GOBACK.

       PROCESO.

           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(2) 
           MOVE ZEROS TO CAMPO1.
           MOVE ZEROS TO CAMPO2.

           COMPUTE BUCLE = FUNCTION RANDOM * 100

      * SUMAR Y RESTAR DATOS A LOS CAMPOS DE TRABAJO Y
      * HACER UN SLEEP
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX = BUCLE
           MOVE 1 TO COB(3) 
               DIVIDE IDX BY 5 GIVING ENTERO REMAINDER RESTO

               EVALUATE RESTO
                  WHEN 0  
           MOVE 1 TO COB(4) 
                          ADD 1 TO CAMPO1
                  WHEN 1  
           MOVE 1 TO COB(5) 
                          ADD 1 TO CAMPO2
                  WHEN 2  
           MOVE 1 TO COB(6) 
                          SUBTRACT 1 FROM CAMPO1
                  WHEN 3  
           MOVE 1 TO COB(7) 
                          SUBTRACT 1 FROM CAMPO2
                  WHEN 4  
           MOVE 1 TO COB(8) 
                          COMPUTE SEMILLA = FUNCTION RANDOM * 1000000
                          COMPUTE SEMILLA = SEMILLA * 100
           CALL TRAP OF S14421338 USING 264 16 S14421338
                'CBL_OC_NANOSLEEP' 
                          CALL "CBL_OC_NANOSLEEP" USING SEMILLA
           CALL TRAP OF S14421338 USING 265 16 S14421338
                'CBL_OC_NANOSLEEP' 
              END-EVALUATE

           MOVE 1 TO COB(9) 
           END-PERFORM
           MOVE 1 TO COB(10) 
                      .

           COMPUTE SEMILLA = FUNCTION RANDOM * 100000.
           DIVIDE SEMILLA BY 25 GIVING ENTERO REMAINDER IDRUTINA

           IF CURR-DEPTH < TB-DEPTH(CURR-ARBOL)
           MOVE 1 TO COB(11) 
           CALL TRAP OF S14421338 USING 264 LENGTH OF RUTINA S14421338
                RUTINA 
              CALL RUTINA USING ARB-DATA
           CALL TRAP OF S14421338 USING 265 LENGTH OF RUTINA S14421338
                RUTINA 
              SUBTRACT 1 FROM CURR-DEPTH
           END-IF
           MOVE 1 TO COB(12) 
                 .
 

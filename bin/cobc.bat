::####################################################################
::
::        SERENDIPITY
::
:: Name  : cobc
:: Env.  : Windows
:: Author: Javier Gonzalez
:: Mail  : javier.gonzalez.grandez@gmail.com
::
:: Description:
::    Compila los programas pasados por parametros
::    Utiliza los compiladores de RainCode
::    Es invocado por cobc
::
:: Uso:
::    cobc
::####################################################################

@ECHO OFF

SET DIRTMP=P:\SDP\TMP
SET DIREXE=P:\SDP\Cobol\BIN

:COMPILE
   IF "%~1"=="" GOTO END
   FOR %%f in (%1) DO (
              SET RC=0
              :<nul (set /p NADA="Compiling %%~nf ")
              COBRC :OutputDir=%DIREXE% %%f
              IF %ERRORLEVEL% NEQ 0 SET RC=1
              IF %RC EQU 1 ECHO "   KO"
              IF %RC EQU 0 ECHO "   OK"
      )
   SHIFT
   GOTO COMPILE

:END
   DEL /F /Q %DIREXE%\*.pdb
   
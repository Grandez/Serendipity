::###################################################################
::
::        SERENDIPITY
::
:: Name  : SDPEnv
:: Env.  : Windows
:: Author: Javier Gonzalez
:: Mail  : javier.gonzalez.grandez@gmail.com
::
:: Description:
::    Establece el entorno de trabajo para ejecutar programas COBOL
::
:: Dependencias
::    n/a
::
:: Uso:
::    SDPCobol
::
:: Notas:
::  Se ejecuta en el compilador COBC
::  
::##################################################################

:@ECHO Estableciendo entorno para SERENDIPITY COBOL
@ECHO OFF

TITLE COBOL SERENDIPITY

: Directorios 

SET SDPENV=1
:SET MFDIR=E:\SDK\COBOL\MF\Bin
SET MYSQL=D:\Servers\SGDB\Maria\bin
SET COBPATH=P:\SDP\LIB
SET RCDIR=D:\Des\Cobol\RainCode\bin

SET PATH=P:\SDP\bin;%RCDIR%;%MYSQL%;%PATH%
SET COBOLIT_LICENSE=%RCDIR%\citlicense.xml

: CALL setmqenv -m SDP.QMGR

: ECHO "%PATH%" | findstr /I /C:"%MFDIR%" 1>nul

: IF ERRORLEVEL 1 SET PATH=%MFDIR%;%MYSQL%;%PATH%

CD P:\SDP
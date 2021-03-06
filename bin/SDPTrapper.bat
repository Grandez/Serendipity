﻿: ###########################################################
:                    SDPTrapper
:
:  Procesa el modulo fuente
:     1.- Genera el nuevo modulo fuente
:     2.- Envia los datos al servidos
: 
:  Cuando se ejecuta en modo masivo, la JVM da un error
:  de GC por que se invoca demasiadas veces
: 
:  Parametros: 
: 
:  Autor: Javier Gonzalez
: 
: ##########################################################

@ECHO OFF
SET RMIPORT=-Dcom.sun.management.jmxremote.port=3124
SET RMIAUT=-Dcom.sun.management.jmxremote.authenticate=false
SET RMISSL=-Dcom.sun.management.jmxremote.ssl=false
SET JMC=-XX:+UnlockCommercialFeatures
SET JMF=-XX:+FlightRecorder
SET JAVA=D:\SDK\JDK\bin\Java

SET BASE=P:\SDP
SET LIB=%SDPBASE%\Lib
SET CFG=%SDPBASE%\Config

SET CLASSPATH=%LIB%\SDPTrapper.jar;%LIB%\SDPBase.jar;%LIB%\SDPClientHTML.jar;%CFG%
SET CLASS=com.jgg.sdp.Trapper

%JAVA% %CLASS% %* 
 
############################################################
#                   SDPLoader
#
# Ejecuta SDPTrapper en modo masivo por por bloques de programas
#
# Cuando se ejecuta en modo masivo, la JVM da un error
# de GC por que se invoca demasiadas veces
#
# Parametros: 
#
# Autor: Javier Gonzalez
#
###########################################################

PKG=/cygdrive/P/SDP
LIBJAR=${PKG}/Lib
LIBCFG=${PKG}/Config

RMI="-Dcom.sun.management.jmxremote.port=3124 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
JMC="-XX:+UnlockCommercialFeatures -XX:+FlightRecorder"

BASE=/cygdrive/P/SDP/BBVA
SRC=$BASE/SRC
WRK=$BASE/wrk
BLK=100

   		
PWD=`pwd`

cd $SRC
count=0
bloque=0

rm -f $WRK/*

for i in `ls *` ; do

   cp $i $WRK
   (( count += 1 ))

   if (( $count % $BLK == 0 )) ; then
      (( bloque += 1 ))
      
      echo `date +%T ` - Procesando Bloque $bloque
      java $RMI $JMC -cp `cygpath -pw ${LIBJAR}/SDPTrapper.jar:${LIBJAR}/SDPBase.jar:${LIBJAR}/SDPClientHTTP.jar:${LIBCFG}` com.jgg.sdp.Trapper  $*
      rc=$?
      if [ $rc -gt 4 ] ; then exit $rc ; fi   
      rm -f $WRK/*
   fi
  
done   

# Ultimo bloque
      (( bloque += 1 ))
      echo `date +%T ` - Procesando Bloque $bloque
      java $RMI $JMC -cp `cygpath -pw ${LIBJAR}/SDPTrapper.jar:${LIBJAR}/SDPBase.jar:${LIBJAR}/SDPClientHTML.jar:${LIBCFG}` com.jgg.sdp.Trapper  $*
      rc=$?
      if [ $rc -gt 4 ] ; then
        exit $rc
      fi   

echo Total $count

#!/bin/sh
# thus file will help to install apache24 install in jail created with Bastille
# install php-fpm with phpxx. The required php packeage list should be 
# phpxx-pkgs.txt file, oen package pr line format
# comman line parameters are jailname phpversion
# test Nr. of parameters
#!/bin/sh
# thus file will hel ins mysql57-server install in jail
# also he preiodic backup
# comman line parameters jailname
if [ ! $# -eq 1 ] ; then
  echo " usage bootstrap-apache.sh jailname phpversion"
  exit
fi
JAIL="$1"
echo "$JAIL"
JAILPATH="/usr/local/bastille/jails/$JAIL/root"
if [ ! -e ${JAILPATH} ] ; then
  echo "Bad jailname ${JAIL}"
  exit
fi
INIPATH="/usr/local/etc"
# install package apache24
if  ! pkg -j $JAIL info | grep apache24 ; then
  pkg -j ${JAIL} install apache24 -y
else
  echo "apache24 already installed in $JAIL"
fi
sysrc -j ${JAIL} apache_enable=YES
echo "sysrc apache24_enable=YES done"
#jexec ${JAIL} service apache-server start
PHPVER="$2"
# install php packages from file phpxx-pkgs.txt
# test if tha last module installed
if  ! pkg -j $JAIL info | grep ${PHPVER}-zlib ; then
  cat  ${PHPVER}-pkgs.txt |xargs pkg -j ${JAIL} install -y
else
  echo "${PHPVER}-zlib already installed in $JAIL"
fi
# create php.ini
if [ ! -e ${JAILPATH}/${INIPATH}/php.ini ]; then
  cp ${JAILPATH}${INIPATH}/php.ini-production ${JAILPATH}${INIPATH}/php.ini
fi
echo "OK"

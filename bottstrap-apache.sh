#!/bin/sh
# thus file will hel ins mysql57-server install in jail
# also he preiodic backup
# comman line parameters jailname
JAIL="$1"
echo "$JAIL"

JAILPATH="/usr/local/bastille/jails/$JAIL/root"
INIPATH="/usr/local/etc"
# install package
if  ! pkg -j $JAIL info | grep apache24 ; then
  pkg -j ${JAIL} install apache24 -y
else
  echo "apache24 already installed in $JAIL"
fi
sysrc -j ${JAIL} apache_enable=YES
echo "sysrc apache24_enable=YES done"
#jexec ${JAIL} service apache-server start
# install php74 packages form file php74-pkgs.txt
# test if tha last module installed
if  ! pkg -j $JAIL info | grep php74-zlib ; then
#  pkg -j ${JAIL} install php74-zlib
  cat php74-pkgs.txt |xargs pkg -j ${JAIL} install -y
else
  echo "php74-zlib already installed in $JAIL"
fi
# create php.ini
if [ ! -e ${JAILPATH}/${INIPATH}/php.ini ]; then
  cp ${JAILPATH}${INIPATH}/php.ini-production ${JAILPATH}${INIPATH}/php.ini
fi
echo "OK"


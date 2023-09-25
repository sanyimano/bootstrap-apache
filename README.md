# boortstrap-apache
 Apache setting in Bastille jail
Test if package already installed, if not intsall it
Enable autostart in rc.conf
Test if php package installed, if not install it
Create php.ini from php.ini-production
Configure php-fpm for unix sockets
Enable autostart in rc.conf
Configure apache for using php-fpm sockets
Remove mod_php ig installed
Set usgaen of mod_mpm_event on
Turn usage of mod_mpm_prefork off
Test modules settings
Create 030_php-fpm.conf in modules.d
Create Virtualhost section in extra/httpd-vhosts.conf
Create info.php file for testing
Message, how to test the settings in a browser

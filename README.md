# zabbix-cups

## Zabbix template for monitoring CUPS servers, printers and queues via Zabbix Agent

Written by andre@schild.ws

At the moment we only monitor printers and their queues, but not the classes.


The configuration files and scripts have to be placed in the correct
directories as shown in the repository.

The locations are for Debian Wheezy with Zabbix 2.4.x installed.

######"Template App CUPS.xml"
    -> Import this template on your Zabbix server and assign it to your
       monitored CUPS servers

######"/etc/zabbix/zabbix_agentd.d/cups.conf"
    -> Place in the file on your CUPS serverno modification needed, 
       unless you place the external script in another location.

######"/usr/local/lib/zabbix/externalscripts/discover_cups_printers.pl"
    -> The script doing the actual cups printer discovery.
       If you place this script in another location, you will have to
       change sudoers.d and the zabbix files accordingly


# zabbix-cups

## Zabbix template for monitoring CUPS servers, printers and queues via Zabbix Agent

Written by andre@schild.ws

At the moment we only monitor printers and their queues, but not the classes.

The configuration files and scripts have to be placed in the correct
directories as shown in the repository.

The locations are for Debian Wheezy with Zabbix 2.4.x installed.

- `Template_App_CUPS.xml`
    -> Import this template on your Zabbix server and assign it to your
       monitored CUPS servers

- `/etc/zabbix/zabbix_agentd.d/cups.conf`
    -> Place in the file on your CUPS serverno modification needed,
       unless you place the external script in another location.

- `/usr/local/lib/zabbix/externalscripts/discover_cups_printers.pl`
    -> The script doing the actual cups printer discovery.
       If you place this script in another location, you will have to
       change sudoers.d and the zabbix files accordingly

## SELinux

If you are running with [selinux](https://en.wikipedia.org/wiki/Security-Enhanced_Linux)
enabled, the discovery script should be placed in a directory that is
configured to have `zabbix_script_exec_t`. You can check with the `semanage`
command:

```bash
$ semanage fcontext -l | grep zabbix_script_exec_t
/var/lib/zabbixsrv/.*scripts(/.*)?                 all files          system_u:object_r:zabbix_script_exec_t:s0
$
```

Use `restorecon` after copying the script, e.g.

```bash
$ cp usr/local/lib/zabbix/externalscripts/discover_cups_printers.pl /var/lib/zabbixsrv/externalscripts/.
$ ls -lZ /var/lib/zabbixsrv/externalscripts/discover_cups_printers.pl
$ restorecon /var/lib/zabbixsrv/externalscripts/discover_cups_printers.pl
$ ls -lZ /var/lib/zabbixsrv/externalscripts/discover_cups_printers.pl
```

More information in the [zabbix_script_selinux man page](https://www.mankier.com/8/zabbix_script_selinux).

Same for the config file:

```bash
$ cp etc/zabbix/zabbix_agentd.d/cups.conf /etc/zabbix_agentd.conf.d/.
$ ls -lZ /etc/zabbix_agentd.conf.d/
$ restorecon /etc/zabbix_agentd.conf.d/cups.conf
$ ls -lZ /etc/zabbix_agentd.conf.d/
```

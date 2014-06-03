mysql
=====

Installs mysql server and supporting tools.

Samples
-------
```
include mysql
include mysql::client
include mysql::devel
```
```
msyql::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

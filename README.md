mysql
=====

Installs mysql server and supporting tools.

Samples
-------
```
include mysql
include mysql::mmm
include mysql::top
```
```
msyql::service { 'default': ensure => running, enable => true }
```

Notes
-----

Needs a lot of work. Don't use the config.

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com

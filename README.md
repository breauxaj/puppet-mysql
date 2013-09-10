mysql
=====

Installs mysql server and supporting tools.

Samples
-------
```
include mysql, mysql::mmm, mysql::top
```
```
msyql::service { 'default':
  ensure => running,
  enable => true,
}
```

MySQL
=====

Installs mysql server and supporting tools.

Samples
=======

include mysql

msyql::service { 'default':
    ensure => running,
    enable => true,
}

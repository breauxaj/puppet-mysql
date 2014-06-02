class mysql (
  $ensure = 'latest',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-server' ],
  }

  package { $required: ensure => $ensure }

  file { '/usr/local/sbin/mysqltuner.pl':
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/mysql/mysqltuner.pl'
  }

}

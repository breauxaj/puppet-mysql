class mysql (
  $ensure = 'installed',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'mysql-server'
    ],
  }

  $removed = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'MariaDB-client',
      'MariaDB-server'
    ],
  }

  package { $removed:
    ensure => absent,
    before => Package[$required],
  }

  package { $required:
    ensure => $ensure
  }

  file { '/usr/local/sbin/mysqltuner.pl':
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/mysql/mysqltuner.pl'
  }

}

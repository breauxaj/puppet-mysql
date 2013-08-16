class mysql {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql', 'mysql-mmm', 'mysql-server' ],
  }

  package { $required: ensure => latest }

  file { '/usr/local/sbin/tuning-primer.sh':
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/mysql/tuning-primer.sh'
  }

}

define mysql::service ( $ensure = running,
                        $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysqld',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

define mysql::config ( $size,
                       $port = '3306',
                       $socket = '/var/lib/mysql/mysql.sock' ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysqld',
  }

  $config = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/my.cnf',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0664,
    content => template("mysql/my-${size}.erb"),
    notify  => Service[$service],
  }

}

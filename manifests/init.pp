class mysql {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-server' ],
  }

  package { $required: ensure => latest }

  file { '/usr/local/sbin/tuning-primer.sh':
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/mysql/tuning-primer.sh'
  }

}

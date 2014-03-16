class mysql::top (
  $ensure = 'latest'
){
  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-server' ],
  }

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mytop' ],
  }

  package { $required:
    ensure  => $ensure,
    require => Package[$depends]
  }

}

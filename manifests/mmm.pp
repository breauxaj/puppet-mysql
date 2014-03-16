class mysql::mmm (
  $ensure = 'latest'
){
  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-server' ],
  }

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-mmm' ],
  }

  package { $required:
    ensure  => $ensure,
    require => Package[$depends]
  }

}

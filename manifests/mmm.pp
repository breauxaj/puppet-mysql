class mysql::mmm {
  Class['mysql::mmm']->Class['mysql']

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-mmm' ],
  }

  package { $required: ensure => latest }

}

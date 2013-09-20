class mysql::top {
  Class['mysql::top']->Class['mysql']

  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mytop' ],
  }

  package { $required: ensure => latest }

}

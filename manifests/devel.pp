class mysql::devel (
  $ensure = 'installed',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql-devel' ],
  }

  package { $required: ensure => $ensure }

}

class mysql::client (
  $ensure = 'latest',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql' ],
  }

  package { $required: ensure => $ensure }

}

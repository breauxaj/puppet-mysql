class mysql::client (
  $ensure = 'installed',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'mysql' ],
  }

  package { $required: ensure => $ensure }

}

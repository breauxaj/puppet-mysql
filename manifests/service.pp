define mysql::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysqld',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

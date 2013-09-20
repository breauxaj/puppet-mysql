define mysql::config (
  $size,
  $port = '3306',
  $socket = '/var/lib/mysql/mysql.sock'
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'mysqld',
  }

  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/my.cnf',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => template("mysql/my-${size}.erb"),
    notify  => Service[$service],
  }

}

class skeleton {
  file {'/etc/skel/.bashrc':
    ensure => file,
    source => '/etc/skel',
  }
}

class memcached {

  package {'memcached':
    ensure => present,
  }

  file {'memcached-sysconfig':
    ensure  => file ,
    path    => '/etc/sysconfig/memcached',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///module/memcached/memcached-sysconfig',
    require => package['memcached'],
  }

  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['memcached-sysconfig'],
  }
}
  

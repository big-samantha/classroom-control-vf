class memcached {
  ensure => present,
 }
 
 file {'/etc/sysconfig/memcached':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/memcached/memcached',
  require => Package['memcached'],
 }
 
 Service { 'memcached':
  ensure => running,
  enable => true,
  Subscribe => File{'/ect/sysconfig/memcached'],
 }
} 

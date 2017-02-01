class memecached {
package { 'memcached':
  ensure => present,
  }
  
  file { '/etc/sysconfig/memcached':
    ensuer => file,
    source => 'puppet://modules/memcached/memcached',
    require => Package['memcached'],
    }
  service { 'memcached':
    ensure => running,
    enabled => true,
    subsribe => File['/etc/sysconfing/memcache'],
    }

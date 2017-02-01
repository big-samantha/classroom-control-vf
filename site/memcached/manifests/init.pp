class memcached {
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
    subscribe => File['/etc/sysconfing/memcache'],
    }
   }

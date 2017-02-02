class nginx {
  package { 'nginx':
    ensure => present,
  }
  
  $root_dir = "/var/www"
  
  file { '$root_dir':
    ensure  => 'directory',
    group   => '0',
    mode    => '0755',
    owner   => '0',
    type   => 'directory',
  }

  file { '$root_dir/index.html':
    ensure  => 'file',
    #content => '{md5}e72df373beca2ab0c75ddf7a09ef8093',
    #ctime   => '2017-01-31 15:50:28 +0000',
    group   => '0',
    mode    => '0644',
    #mtime   => '2017-01-31 15:50:28 +0000',
    owner   => '0',
    type    => 'file',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0664',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  file { '/etc/nginx/conf.d':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0775',
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0664',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  service { 'nginx':
    ensure => running,
    enable => true,
  }
  
}

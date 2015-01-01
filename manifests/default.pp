$default_package = [
    'git',
    'screen',
    'tree',
    'wget',
    'zsh',
    'nkf',
]

$phpenv_package = [
    'gcc',
    'bison',
    'libxml2',
    'libxml2-devel',
    'openssl-devel',
    'libcurl-devel',
    'libjpeg-turbo-devel',
    'libpng-devel',
    'libmcrypt-devel',
    'readline-devel',
    'libtidy-devel',
    'libxslt-devel',
    'httpd-devel',
    'php-xml',
]

package { $default_package:
    ensure => installed
}

package { $phpenv_package:
    ensure => installed
}

package { 'httpd':
    ensure => installed
}

package { 'php':
    ensure => installed
}

file { '/etc/httpd/conf/httpd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('httpd.conf'),
    require => [
        Package['httpd'],
        Package['php'],
    ],
    notify => Service['httpd'],
}

file { '/var/www/html':
    ensure  => link,
    target  => '/vagrant',
    require => Exec['rm -rf /var/www/html'],
}

exec { 'rm -rf /var/www/html':
    user => 'root',
    path => [
        '/usr/bin',
        '/usr/sbin',
        '/bin',
        '/sbin',
    ],
    require => Package['httpd'],
}

service { 'httpd':
    enable     => true,
    ensure     => running,
    hasrestart => true,
    require    => File['/etc/httpd/conf/httpd.conf']
}

service { 'iptables':
    enable => false,
    ensure => stopped,
}


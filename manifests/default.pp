package { 'httpd':
    ensure => installed
}

package { 'php':
    ensure => installed
}

service { 'httpd':
    enable     => true,
    ensure     => running,
    hasrestart => true,
    require    => File['/etc/httpd/conf/httpd.conf']
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

service { 'iptables':
    enable => false,
    ensure => stopped,
}

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
]

package { $default_package:
    ensure => installed
}

package { $phpenv_package:
    ensure => installed
}

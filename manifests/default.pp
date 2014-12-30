package { 'httpd':
    ensure => installed
}

package { 'php':
    ensure => installed
}

service { 'httpd':
    enable  => true,
    ensure  => running,
    require => [
        Package['httpd'],
        Package['php'],
    ]
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

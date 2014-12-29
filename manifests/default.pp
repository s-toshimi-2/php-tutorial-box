package { 'httpd':
    ensure => installed
}

package { 'php':
    ensure => installed
}

service { 'httpd':
    ensure  => running,
    require => [
        Package['httpd'],
        Package['php'],
    ]
}

package { 'git':
    ensure => installed
}

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

package { $phpenv_package:
    ensure => installed
}

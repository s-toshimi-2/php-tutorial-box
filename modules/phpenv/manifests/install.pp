class phpenv::install {
    package { 'epel-release':
        provider => 'rpm',
        ensure   => installed,
        source   => 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
    }

    $packages = [
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

    package { $packages :
        ensure => installed
    }
}

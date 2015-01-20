class phpenv::install {
    $packages = [
        'gcc',
        'bison',
        'libxml2',
        'libxml2-devel',
        'openssl-devel',
        'libcurl-devel',
        'libjpeg-turbo-devel',
        'libpng-devel',
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

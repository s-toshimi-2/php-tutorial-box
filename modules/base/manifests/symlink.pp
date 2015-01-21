class base::symlink {
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
    }
}

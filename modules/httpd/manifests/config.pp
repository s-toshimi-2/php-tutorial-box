class httpd::config {
    file { '/etc/httpd/conf/httpd.conf':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('httpd/httpd.conf'),
    }
}

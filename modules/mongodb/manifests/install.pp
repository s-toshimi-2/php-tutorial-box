class mongodb::install {
    package { 'mongodb-org':
        ensure  => installed,
        require => File['/etc/yum.repos.d/mongodb.repo'],
    }

    file { '/etc/yum.repos.d/mongodb.repo':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('mongodb/mongodb.repo'),
    }
}

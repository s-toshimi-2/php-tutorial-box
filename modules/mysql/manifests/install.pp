class mysql::install {
    package { 'mysql-community-release':
        provider => 'rpm',
        ensure   => installed,
        source   => 'http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm'
    }

    package { 'mysql-community-server':
        ensure  => installed,
        require => Package['mysql-community-release']
    }
}

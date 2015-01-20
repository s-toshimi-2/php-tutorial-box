class mysql {
    include mysql::install
    include mysql::config
    include mysql::service
}

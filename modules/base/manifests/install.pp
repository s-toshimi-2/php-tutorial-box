class base::install {
    $packages = [
        'git',
        'nkf',
        'screen',
        'tree',
        'wget',
        'zsh',
    ]

    package { $packages :
        ensure => installed
    }
}

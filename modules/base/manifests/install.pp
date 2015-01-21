class base::install {
    $packages = [
        'git',
        'nkf',
        'screen',
        'tree',
        'wget',
        'zsh',
        'patch',
    ]

    package { $packages :
        ensure => installed
    }
}

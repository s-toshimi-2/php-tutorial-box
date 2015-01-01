#! /usr/bin/env bash

if [ ! -e $HOME/phpenv ]; then
    git clone https://github.com/CHH/phpenv.git $HOME/phpenv
fi

if [ ! -e $HOME/.phpenv ]; then
    $HOME/phpenv/bin/phpenv-install.sh
    echo 'export PATH="/home/vagrant/.phpenv/bin:$PATH"' >> $HOME/.bashrc
    echo 'eval "$(phpenv init -)"' >> $HOME/.bashrc
fi

if [ -e $HOME/.phpenv ] && [ ! -e $HOME/.phpenv/plugins/php-build ]; then
    git clone https://github.com/CHH/php-build.git $HOME/.phpenv/plugins/php-build
    echo "--with-apxs2=`which apxs`" >> $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options
    curl https://gist.githubusercontent.com/tkuchiki/10112836/raw/php-build.patch | patch -u $HOME/.phpenv/plugins/php-build/bin/php-build -
fi

if [ -e $HOME/.phpenv ] && [ ! -e $HOME/.phpenv/versions/system/libexec ]; then
    mkdir -p $HOME/.phpenv/versions/default/libexec
    sudo cp /etc/httpd/modules/libphp5.so /home/vagrant/.phpenv/versions/default/libexec
fi

if [ -e $HOME/.phpenv ] && [ ! -e $HOME/.phpenv/plugins/phpenv-apache-version ]; then
    git clone https://github.com/garamon/phpenv-apache-version $HOME/.phpenv/plugins/phpenv-apache-version
    curl https://gist.githubusercontent.com/s-toshimi-2/1840adf4f39cc00105ae/raw/16a2afb9dc764657f27b4161036f9d27d1d22e55/phpenv-module-path.patch | patch -u $HOME/.phpenv/plugins/phpenv-apache-version/bin/rbenv-apache-version -
fi

echo "Restart your shell or execute 'source $HOME/.bashrc'"

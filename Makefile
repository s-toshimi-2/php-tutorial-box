setup:
	/vagrant/create_phpenv.sh

composer.phar:
	curl -s http://getcomposer.org/installer | php

install: composer.phar
	php /vagrant/composer.phar install

PHP=$(shell which php)
CURL=$(shell which curl)

setup:
	/vagrant/scripts/create_phpenv.sh

composer.phar:
	$(CURL) -s http://getcomposer.org/installer | $(PHP)

install: composer.phar
	$(PHP) /vagrant/composer.phar install

switch_php:
	phpenv global $(VERSION)
	phpenv apache-version $(VERSION)

# Vagrant + phpenv + PHP + Slim

* setup and login

	```
	$ vagrant up
	$ vagrant ssh
	```

* setup phpenv

	```
	$ cd /vagrant
	$ make setup
	```

* install composer.phar and modules

	```
	$ cd /vagrant
	$ make install
	```
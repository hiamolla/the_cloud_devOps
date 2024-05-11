# TASK
- Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo.

# STEPS: 

## Add PHP PPA Repository:- We’ll use the ppa:ondrej/php PPA repository to install PHP 7.4 but firstly we'll start by running the following commands

- run `sudo apt update` to update

- run `sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath` to add some extensions with the apt package manager.

- run `php -m` to list all loaded PHP modules

- run `sudo apt-get update` to update again

- run `sudo apt -y install software-properties-common` to install software properties common

- run `sudo add-apt-repository ppa:ondrej/php` to add ppa:ondrej/php PPA repository

- run `sudo apt-get update` to update again

- run `sudo apt -y install php7.4` to install php7.4

- run `php -v` to check the version installed

- run `sudo apt install -y php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,common}` to install additional packages.

![](./images5/php%20vrs.png)

# INSTRUCTION
- Learn how to use the add-apt-repository command
- Submit the content of /etc/apt/sources.list and the output of php -v command.

### /etc/apt/sources.list 
![](./images5/sudo%20cat%20etc%20php.png)
![](./images5/nb%20software%20repo%20may%20not.png)

### php -v output
![](./images5/php%20v.png)
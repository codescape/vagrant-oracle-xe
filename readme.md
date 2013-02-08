vagrant-oracle-xe
=================

This project aims to ease the provisioning of an Oracle Database XE 11g instance running on Ubuntu 11.10 with 64bit. If yu are interested in running your Oracle Database XE 11g instance on Ubuntu 12.04 you should have a look at https://github.com/hilverd/vagrant-ubuntu-oracle-xe.

Getting started
---------------

* Clone this repository and checkout a local copy.
* Make sure you have both [VirtualBox](https://www.virtualbox.org) and [Vagrant](http://vagrantup.com) installed.
* Download and copy [Oracle Database Express Edition 11g Release 2](http://www.oracle.com/technetwork/database/express-edition/downloads/index.html) to `modules/oracle/files/oracle-xe-11.2.0-1.0.x86_64.rpm.zip`.
* Run `vagrant up` from your checkout directory.
* Connect to your database at `33.33.33.10:1521/xe` with credentials `sys/manager` or `system/manager`.

Credits
-------

* Using [much of the code](http://www.andrejkoelewijn.com/wp/2012/02/28/oracle-xe-on-ubuntu-using-vagrant-and-puppet/) provided on Andrej Koelwijn's blog.
* Using the [Ubuntu 10.11 VirtualBox](http://timhuegdon.com/vagrant-boxes/ubuntu-11.10.box) created and hosted by Tim Huegdon.

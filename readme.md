Vagrant Oracle XE 11g
=====================

Vagrant provisioning project for an Oracle Database XE 11g instance running on Ubuntu 11.10 with code provided by http://www.andrejkoelewijn.com/wp/2012/02/28/oracle-xe-on-ubuntu-using-vagrant-and-puppet/.

Getting started
---------------

* Install [VirtualBox](https://www.virtualbox.org)
* Install [Vagrant](http://vagrantup.com)
* Download and copy [Oracle Database Express Edition 11g Release 2](http://www.oracle.com/technetwork/database/express-edition/downloads/index.html) to `modules/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip`
* Run `vagrant up` from your checkout directory
* Connect to your database at `33.33.33.10:1521/xe` with credentials `sys/manager` or `system/manager`
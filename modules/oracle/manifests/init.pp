class oracle::server {
  exec {
    "/usr/bin/apt-get -y update":
      alias => "aptUpdate",
      timeout => 3600;
  }

  package {
    "ntp":
      ensure => installed;
    "htop":
      ensure => installed;
    "unzip":
      ensure => installed;
    "monit":
      ensure => installed;
    "rsyslog":
      ensure => installed;
    "curl":
      ensure => installed;
    "alien":
      ensure => installed;
    "libaio1":
      ensure => installed;
    "unixodbc":
      ensure => installed;
    "git":
      ensure => installed;
  }

  service {
    "ntp":
      ensure => stopped;
    "monit":
      ensure => running;
    "rsyslog":
      ensure => running;
    "procps":
      ensure => running;
  }

  file {
    "/etc/sysctl.d/60-oracle.conf":
      source => "puppet:///modules/oracle/xe-sysctl.conf";
  }

  user {
    "syslog":
      ensure => present,
      groups => ["syslog","adm"];
  }
  
  group {
    "puppet":
      ensure => present;
  }
}

class oracle::xe {
  file {
    "/tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip":
      source => "puppet:///modules/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip";
    "/tmp/xe.rsp":
      source => "puppet:///modules/oracle/xe.rsp";
    "/etc/init.d/oracle-shm":
      mode => 0755,
      source => "puppet:///modules/oracle/oracle-shm";
    "/bin/awk":
      ensure => link,
      target => "/usr/bin/awk";
    "/var/lock/subsys":
      ensure => directory;
  }

  exec {
    "unzip xe":
      alias => "unzip xe",
      command => "/usr/bin/unzip -o /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip",
      require => [Package["unzip"],File["/tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip"]],
      cwd => "/tmp",
      user => root,
      creates => "/tmp/oracle-xe-11.2.0-1.0.x86_64.rpm";
    "alien xe":
      command => "/usr/bin/alien --to-deb --scripts /tmp/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm",
      cwd => "/tmp/Disk1",
      require => Exec["unzip xe"],
      creates => "/tmp/Disk1/oracle-xe_11.2.0-2_amd64.deb",
      user => root;
    "configure xe":
      command => "/etc/init.d/oracle-xe configure responseFile=/tmp/xe.rsp >> /tmp/xe-install.log",
      require => [Package["oracle-xe"],Exec["update-rc oracle-shm"]],
      user => root;
    "update-rc oracle-shm":
      command => "/usr/sbin/update-rc.d oracle-shm defaults 01 99",
      cwd => "/etc/init.d",
      require => File["/etc/init.d/oracle-shm"],
      user => root;
    "oracle-shm":
      command => "/etc/init.d/oracle-shm start",
      user => root,
      require => File["/etc/init.d/oracle-shm"];
  }

  package {
    "oracle-xe":
      provider => "dpkg",
      ensure => latest,
      require => Exec["alien xe"],
      source => "/tmp/Disk1/oracle-xe_11.2.0-2_amd64.deb";
  }
}

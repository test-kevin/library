$allow_virtual_packages = hiera('allow_virtual_packages',false)

Package {
  allow_virtual => $allow_virtual_packages,
}

class { 'yum':
  extrarepo => ['nginx', 'remi', 'remi_php55'],
}

class { 'epel': }

class { 'redis':
  require => [
    Yumrepo['remi'],
    Class['epel'],
  ],
}

class { 'memcached':
  require => [
    Yumrepo['remi'],
    Class['epel'],
  ],
}

class { 'gearman':
  require => [
    Yumrepo['remi'],
    Class['epel'],
  ],
}

class {'::mongodb::server':
  port    => 27018,
  require => [
    Yumrepo['remi'],
    Class['epel'],
  ],
}

class { 'php':
  package => 'php',
  service => 'php-fpm',
  require => [
    Yumrepo['remi'],
    Yumrepo['remi-php55'],
    Class['epel'],
  ],
}

php::module {
  [
    'fpm',
    'common',
    'cli',
    'bcmath',
    'mbstring',
    'mcrypt',
    'intl',
    'pdo',
    'mysqlnd',
    'xml',
    'gd',
    'tidy',
    'process',
  ]:
  require => [
    Yumrepo['remi'],
    Yumrepo['remi-php55'],
    Class['epel'],
  ],
}

service { 'php-fpm':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
}

php::pecl::module { [
  'pecl-apcu',
  'pecl-oauth',
  'pecl-xhprof',
  'pecl-gearman',
  'pecl-memcache',
  'pecl-memcached',
  'pecl-redis',
  'pecl-mongo',
]:
  require => [
    Yumrepo['remi'],
    Yumrepo['remi-php55'],
    Class['gearman'],
    Package['php-cli'],
  ],
  service => 'php-fpm',
}

class { 'xdebug':
  service           => 'php-fpm',
  idekey            => 'PHPSTORM',
  remote_host       => '192.168.20.1',
  remote_port       => '9000',
  require           => Package['php-cli'],
}

class { "nginx_install": }

class { 'mysql::server':
  root_password => '123',
  override_options => {
    'mysqld' => {
      'bind_address' => '0.0.0.0',
    }
  },
  require => [
    Yumrepo['remi'],
  ],
}

mysql::db { 'ota':
  user     => 'ota',
  password => 'password',
  host     => 'localhost',
  grant    => 'ALL',
  sql      => '/vagrant/env/database/develop.sql',
}

mysql_user { 'ota@%':
  ensure        => 'present',
  password_hash => mysql_password('password'),
  require       => [ Class['mysql::server'], Class['mysql::client'] ],
}

mysql_grant { 'ota@%/ota.*':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => 'ota.*',
  user       => 'ota@%',
  require    => [ Class['mysql::server'], Class['mysql::client'] ],
}

class { 'firewall': }

Firewall {
  require => undef,
}

firewall { '000 accept all icmp':
  proto   => 'icmp',
  action  => 'accept',
}->
firewall { '001 allow ssh, http, https, mysql, gearman, redis, memcached, mongo':
  port   => [22, 80, 443, 3306, 4730, 6380, 11211, 27018],
  proto  => 'tcp',
  action => 'accept',
}->
firewall { '002 accept related established rules':
  proto   => 'all',
  ctstate => ['RELATED', 'ESTABLISHED'],
  action  => 'accept',
}

composer::exec { 'composer install':
  cmd => 'install',
  cwd => '/vagrant',
  user => 'apache',
  require => Package['php-cli'],
}
class nginx_install () {
  class { "nginx":
    sendfile => 'off',
    require => Yumrepo['nginx'],
  }

  nginx::vhost { 'vagrant' :
    docroot       => '/vagrant',
    template      => "${module_name}/nginx.conf.erb",
  }
}
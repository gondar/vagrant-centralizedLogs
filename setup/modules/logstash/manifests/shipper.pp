# Class: logstash::shipper
class logstash::shipper (
  $workers = 1,
  $config  = 'puppet:///modules/logstash/shipper/shipper.conf',
) {
  require logstash::params
  require logstash

  $web_backend = false
  $process_name = 'shipper'
  $conf = '/etc/logstash/shipper'

  file { '/etc/logstash/shipper':
    ensure  => directory,
    require => File[$logstash::params::etc_dir],
  }

  file { '/etc/logstash/shipper/shipper.conf':
    ensure  => present,
    source  => $config,
    require => File['/etc/logstash/shipper'],
  }

  file { '/etc/init.d/logstash-shipper':
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
    content => template('logstash/logstash-init.erb')
  }

  service { 'logstash-shipper':
    ensure    => running,
    subscribe => [
      File['/etc/init.d/logstash-shipper'],
      File['/etc/logstash/shipper'],
    ]
  }

}

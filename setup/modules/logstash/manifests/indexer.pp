# Class: logstash::indexer
class logstash::indexer (
  $workers     = 1,
  $config      = 'puppet:///modules/logstash/indexer/indexer.conf',
  $web_backend = 'elasticsearch:///?local'
) {
  require logstash::params
  require logstash
  $conf = '/etc/logstash/indexer'
  $process_name = 'indexer'

  file { '/etc/logstash/indexer':
    ensure  => directory,
    require => File[$logstash::params::etc_dir],
  }

  file { '/etc/logstash/indexer/indexer.conf':
    ensure  => present,
    source  => $config,
    require => File['/etc/logstash/indexer'],
  }

  file { '/etc/init.d/logstash-indexer':
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
    content => template('logstash/logstash-init.erb'),
  }

  service { 'logstash-indexer':
    ensure    => running,
    subscribe => [
      File['/etc/init.d/logstash-shipper'],
      File['/etc/logstash/indexer'],
    ]
  }

}

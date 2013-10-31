define logstash::shipper::config (
  $content = undef,
  $source = undef,
) {
  file { "/etc/logstash/shipper/${name}.conf":
    ensure  => present,
    content => $content,
    source  => $source,
    require => Class['logstash::shipper'],
  }
}

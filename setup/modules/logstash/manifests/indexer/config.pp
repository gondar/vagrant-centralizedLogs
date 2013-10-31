define logstash::indexer::config (
  $content = undef,
  $source = undef,
) {
  file { "/etc/logstash/indexer/${name}.conf":
    ensure  => present,
    content => $content,
    source  => $source,
    require => Class['logstash::indexer'],
  }
}

describe 'logstash::indexer::config', :type => :define do
  let(:title) { 'elasticsearch' }
  let(:params) { { :content => 'foo' } }

  it { should contain_file('/etc/logstash/indexer/elasticsearch.conf').with_content('foo') }
end

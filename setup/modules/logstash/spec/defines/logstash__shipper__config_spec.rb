describe 'logstash::shipper::config', :type => :define do
  let(:title) { 'auth' }
  let(:params) { { :content => 'foo' } }

  it { should contain_file('/etc/logstash/shipper/auth.conf').with_content('foo') }
end

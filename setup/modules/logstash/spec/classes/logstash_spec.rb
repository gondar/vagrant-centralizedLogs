require 'spec_helper'

describe 'logstash', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
  it { should contain_package('java').with_name('openjdk-7-jdk').with_ensure('present') }
  it { should contain_file('/usr/local/bin').with_ensure('directory') }
  it { should contain_exec('download logstash jar') }
end

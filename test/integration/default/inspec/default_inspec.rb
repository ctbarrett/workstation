
describe file('/Users/vagrant/.bash_profile') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0644 }
  its('content') { should match %r{\[\[ -f ~/.bashrc \]\] && . ~/.bashrc\n} }
end

describe file('/Users/vagrant/.bashrc') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0644 }
  its('content') { should match(/^# Shell basics/) }
  its('content') { should match(/^# Aliases/) }
  its('content') { should match(/^# Include per-app shell configs/) }
  its('content') { should match(/^# Terminal colors/) }
end

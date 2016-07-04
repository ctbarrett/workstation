describe file('/Users/vagrant/.bash_profile') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0644 }
  its('content') { should match %r{\[\[ -f ~/.bashrc \]\] && . ~/.bashrc\n} }
end

user = 'vagrant'
group = 'staff'
home = "/Users/#{user}"

%w(src).each do |directory|
  describe directory("#{home}/#{directory}") do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by(user) }
    it { should be_grouped_into(group) }
    its('mode') { should eq 0o0700 }
  end
end

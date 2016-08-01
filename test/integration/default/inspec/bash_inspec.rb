user = 'vagrant'
home = "/Users/#{user}"
profile_d = "#{home}/.profile.d"

describe directory(profile_d.to_s) do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
end

describe file("#{home}/.bash_profile") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0600 }
  its('content') { should match %r{\[\[ -f ~/.bashrc \]\] && . ~/.bashrc\n} }
end

describe file("#{home}/.bashrc") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0600 }
  its('content') { should match(/^# Shell basics/) }
  its('content') { should match(/^# Aliases/) }
  its('content') { should match(/^# Include per-app shell configs/) }
  its('content') { should match(/^# Terminal colors/) }
end

describe file("#{home}/.git-prompt-colors.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0600 }
  its('content') { should match(/^# Custom version of the default theme for gitprompt.sh/) }
  its('content') { should match(/^# call only from theme file/) }
end

describe file("#{profile_d}/bash_colors.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(/^# Reset/) }
  its('content') { should match(/^# Regular Colors/) }
  its('content') { should match(/^# Bold/) }
  its('content') { should match(/^# Underline/) }
  its('content') { should match(/^# Background/) }
  its('content') { should match(/^# High Intensity/) }
  its('content') { should match(/^# Bold High Intensity/) }
  its('content') { should match(/^# High Intensity backgrounds/) }
end

describe file("#{profile_d}/bash_completion.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(/^# Configure extra shell command completions/) }
  its('content') { should match(/^complete -C aws_completer aws/) }
end

describe file("#{profile_d}/bash_prompt.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(%r{^## Default/basic/color prompt}) }
end

describe file("#{profile_d}/bash-git-prompt.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(/^## Use Git prompt if available/) }
  its('content') do
    should match(%r{^\s+git_prompt_file="\$\(brew --prefix bash-git-prompt\)/share/gitprompt.sh"})
  end
end

describe file("#{profile_d}/chefdk.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(/^eval "\$\(chef shell-init bash\)"/) }
end

describe file("#{profile_d}/git.sh") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('staff') }
  its('mode') { should eq 0o0700 }
  its('content') { should match(/^# Aliases/) }
  its('content') { should match(/^# Homebrew github token/) }
  its('content') { should match(/^# Setup git-prompt/) }
end

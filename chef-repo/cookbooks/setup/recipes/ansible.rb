
yum_package "ansible" do
end

template '/etc/ansible/ansible.cfg' do
  source 'etc.ansible.cfg.erb'
end

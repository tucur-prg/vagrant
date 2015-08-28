
%w{
  ansible
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

templates '/etc/ansible/ansible.cfg' do
  source 'etc.ansible.cfg.erb'
end

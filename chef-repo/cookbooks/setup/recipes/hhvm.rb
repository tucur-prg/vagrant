
remote_file "/etc/yum.repos.d/hop5.repo" do
    source "http://www.hop5.in/yum/el6/hop5.repo"
end


%w{
  hhvm
}.each do |pkg|
    yum_package "#{pkg}" do
    end
end


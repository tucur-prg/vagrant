
%w{
    nodejs
    npm
}.each do |pkg|
    yum_package "#{pkg}" do
        options '--enablerepo=epel'
    end
end

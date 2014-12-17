
%w{
  golang
}.each do |pkg|
    yum_package "#{pkg}" do
    end
end

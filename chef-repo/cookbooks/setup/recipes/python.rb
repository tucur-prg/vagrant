
%w{
  python-setuptools
  python-pip
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

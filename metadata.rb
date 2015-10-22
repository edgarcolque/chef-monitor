name             "monitor"
maintainer       "Edgar Colque DevOps"
maintainer_email "edgarcolque4425@gmail.com"
license          "Apache 2.0"
description      "A cookbook for monitoring services, using Sensu, a monitoring framework."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.6"

depends "sensu"
depends "sudo"
depends "uchiwa"
depends "opentsdb" 
depends "grafana2"

recipe  "master", "server installer"
recipe  "default", "client installer"

%w[
  ubuntu
  debian
  centos
  redhat
  fedora
].each do |os|
  supports os
end

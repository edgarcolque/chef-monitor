#
# Cookbook Name:: monitor
# Recipe:: checks
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#sensu_check "cron_process" do
#  command "check-procs.rb -p cron -C 1"
#  handlers ["relay"]
#  subscribers ["all"]
#  interval 30
#  additional(:notification => "Cron is not running", :occurrences => 5)
#end

#sensu_check "http_checks" do
#  command "check-http.rb -h localhost -u http://localhost/index.php"
#  handlers ["relay"]
#  subscribers ["web"]
#  interval 30
#  additional(:notification => "http://localhost/index.php is down", :occurrences => 5)
#end

sensu_check "sys.disk.usage" do
  name "sys.disk.usage"
  command "check-disk-usage.rb -w 80 -c 90"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:notification => "Disk usage is on critical status", :occurrences => 5)
end

sensu_check "sys.metrics.disk" do
  name "sys.metrics.disk"
  type "metric"
  command "metrics-disk.rb --scheme sys.metrics.disk -c"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.disk.capacity" do
  name "sys.metrics.disk.capacity"
  type "metric"
  command "metrics-disk-capacity.rb --scheme sys.metrics.disk.capacity"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.memory.percent" do
  name "sys.metrics.memory.percent"
  type "metric"
  command "metrics-memory-percent.rb --scheme sys.metrics.memory.percent"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.memory" do
  name "sys.metrics.memory"
  type "metric"
  command "metrics-memory.rb --scheme sys.metrics.memory"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.interface.eth0" do
  name "sys.metrics.interface.eth0"
  type "metric"
  command "metrics-interface.rb --scheme sys.metrics.interface.eth0 --exclude-interface eth0"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.net" do
  name "sys.metrics.net"
  type "metric"
  command "metrics-net.rb --scheme sys.metrics.net"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.netstat.tcp.80" do
  name "sys.metrics.netstat.tcp.80"
  type "metric"
  command "metrics-netstat-tcp.rb --scheme sys.metrics.netstat.tcp --port 80"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

sensu_check "sys.metrics.sockstat" do
  name "sys.metrics.sockstat"
  type "metric"
  command "metrics-sockstat.rb --scheme sys.metrics.sockstat"
  handlers ["relay"]
  subscribers ["all"]
  interval 30
  additional(:auto_tag_host => "yes")
end

include_recipe "sensu::client_service"

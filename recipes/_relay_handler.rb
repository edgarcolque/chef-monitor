#
# Cookbook Name:: monitor
# Recipe:: _opentsdb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "monitor::_extensions"

opentsdb_address = node["monitor"]["opentsdb_address"]
opentsdb_port = node["monitor"]["opentsdb_port"]

#https://github.com/opower/sensu-metrics-relay

%w[handlers
  mutators].each do |dir|
  directory File.join(node.monitor.server_extension_dir, dir) do
    owner node.sensu.admin_user
    group node.sensu.group
    recursive true
    mode node.sensu.directory_mode
  end 
end

cookbook_file File.join("#{node['monitor']['server_extension_dir']}/handlers", "relay.rb") do
  source "extensions/handlers/relay.rb"
  owner node.sensu.admin_user
  group node.sensu.group
  mode 0755
end

cookbook_file File.join("#{node["monitor"]["server_extension_dir"]}/mutators", "metrics.rb") do
  source "extensions/mutators/metrics.rb"
  owner node.sensu.admin_user
  group node.sensu.group
  mode 0755
end

cookbook_file "/etc/sensu/conf.d/config_relay.json" do
  source "conf.d/config_relay.json"
  owner node.sensu.admin_user
  group node.sensu.group
  mode 0755
  notifies :create, "ruby_block[sensu_service_trigger]", :immediately
end


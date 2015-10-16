#
# Cookbook Name:: monitor
# Recipe:: _opentsdb
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

opentsdb_address = node["monitor"]["opentsdb_address"]
opentsdb_port = node["monitor"]["opentsdb_port"]


#########################################################
#https://sensuapp.org/docs/latest/enterprise-built-in-handlers#opentsdb
sensu_gem "sensu-plugins-opentsdb"

cookbook_file  "/etc/sensu/conf.d/handlers/opentsdb.json" do
  source "handlers/opentsdb.json"
  mode 0755
end

#sensu_handler "opentsdb" do

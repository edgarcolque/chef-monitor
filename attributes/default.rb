# installation
override["sensu"]["version"] = "0.18.1-1"
override["sensu"]["log_level"] = "info"
override["sensu"]["use_ssl"] = false
override["sensu"]["use_embedded_ruby"] = true


default["monitor"]["master_address"] = nil

default["monitor"]["environment_aware_search"] = false
default["monitor"]["use_local_ipv4"] = false

default["monitor"]["additional_client_attributes"] = Mash.new

default["monitor"]["use_nagios_plugins"] = false
default["monitor"]["use_system_profile"] = false
default["monitor"]["use_statsd_input"] = false

default["monitor"]["use_opentsdb"] = true
default['opentsdb']['hbase_version'] = '0.94.27'

default["monitor"]["use_grafana"] = true
default['grafana']['version'] = '2.1.3'
default['grafana']['port'] = '3001'
default['grafana']['protocol'] = 'http'

default["monitor"]["sudo_commands"] = Array.new

default["monitor"]["default_handlers"] = ["debug"]
default["monitor"]["metric_handlers"] = ["relay"]

default["monitor"]["client_extension_dir"] = "/etc/sensu/extensions/client"
default["monitor"]["server_extension_dir"] = "/etc/sensu/extensions/server"

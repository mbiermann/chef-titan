# SSL is required for OpsCenter server to run
package "libssl0.9.8"

# Install the OpsCenter server only. Agents can then be configured via OpsCode dashboard.
include_recipe "cassandra-chef-cookbook::opscenter_server"

################################################################################
# Install OpsCenter cluster configurations
################################################################################

# Folder cluster configurations go to be handled by OpsCenter
clusters_conf_path = "/etc/opscenter/clusters"

# Firstly remove any existing default configurations
directory clusters_conf_path do
	action :delete
end
directory clusters_conf_path do
	action :create
end

# Install a configuration file for each cluster specified in attributes
node[:opscenter][:clusters].each do |cluster|
	template "#{clusters_conf_path}/#{cluster.name.tr(" ", "_")}.conf" do
		source "opscenter_cluster.conf.erb"
		variables(cluster)
		owner 'root'
  		mode  0755
		notifies :restart, 'service[opscenterd]', :delayed
	end
end

# Finally restart OpsCenter
service "titan" do 
	action :restart
end

# Finally restart OpsCenter
service "opscenterd" do 
	action :restart
end
# SSL is required for OpsCenter server to run
package "libssl0.9.8"

# Install the OpsCenter server only. Agents can then be configured via OpsCode dashboard.
include_recipe "cassandra::opscenter_server"
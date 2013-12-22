override['java']['install_flavor'] = "oracle"
override['java']['jdk_version'] = '7'
override['java']['oracle']['accept_oracle_download_terms'] = true

default[:titan] = {
  :download_url => "http://s3.thinkaurelius.com/downloads/titan/titan-server-0.4.1.zip",
  :installation_dir => "/usr/local/titan",
  :user => "titan"
}
default[:titan][:bundle] = File.basename(default[:titan][:download_url])
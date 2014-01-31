include_recipe "apt"
include_recipe "java"

require "tmpdir"

td      = Dir.tmpdir
tmp     = File.join(td, node[:titan][:bundle])
zip_dir = File.join(td, File.basename(node[:titan][:bundle], File.extname(node[:titan][:bundle])))

puts td
puts tmp
puts zip_dir

remote_file(tmp) do
  source node.titan.download_url
  action :create_if_missing
end

user "#{node.titan.user}" do
  home "/home/#{node.titan.user}"
  shell "/bin/bash"
  system true
  password "#{node.titan.user}" 
end

package "unzip"
bash "extract #{tmp}, move it to #{node.titan.installation_dir}" do
  cwd  "/tmp"
  code <<-EOS
    unzip -o #{tmp}
    rm -rf #{node.titan.installation_dir}
    mkdir #{node.titan.installation_dir}
    mv #{zip_dir}/* #{node.titan.installation_dir}
    rm -rf #{zip_dir}
  EOS
  creates "#{node.titan.installation_dir}/bin/titan.sh"
end

["/usr/local/titan"].each do |dir|
  bash "chown -R #{node.titan.user}:#{node.titan.user} #{dir}" do
    user "root"
    code "([ -d #{dir} ] || mkdir -p #{dir}) && chown -R #{node.titan.user}:#{node.titan.user} #{dir} && chmod -R 777 #{dir}"
  end
end
                                                                         
template "/etc/init.d/titan" do
  source "titan.init.erb"
  owner 'root'
  mode  0755
end

service "titan" do
  supports :start => true, :stop => false, :restart => true, :status => true
  action [:enable, :start]
end

include_recipe "titan::graph"
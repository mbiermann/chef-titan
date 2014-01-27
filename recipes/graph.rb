file = "rexster-cassandra-es.xml"

bash "install_graph" do
	code <<-EOH
		mv #{file} #{file}.old
		sed "s/<graph-name>[^<]*<\/graph-name>/<graph-name>#{node[:titan][:graph]}<\/graph-name>/"  #{file}.old > #{file}
		rm -f #{file}.old
	EOH
	cwd "/usr/local/titan/conf/"
	notifies :restart, 'service[titan]', :delayed
end
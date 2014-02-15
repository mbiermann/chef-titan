file = "rexster-cassandra-es.xml"

bash "install_graph" do
	code <<-EOH
		mv #{file} #{file}.old
		sed "s/<graph-name>[^<]*<\\/graph-name>/<graph-name>#{node[:titan][:graph]}<\\/graph-name>/" #{file}.old > #{file}
		rm -f #{file}.old
		chmod 0755 #{file}
	EOH
	user	"titan"
	group	"titan"
	cwd "/usr/local/titan/conf/"
end
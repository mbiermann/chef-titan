file = "rexster.sh"
heap_size = node[:rexster_jvm][:heap_size]
params = node[:rexster_jvm][:params]

bash "install_graph" do
	code <<-EOH
		mv #{file} #{file}.old
		sed "s/-Xms128m -Xmx512m/-Xms#{heap_size[:start]} -Xmx#{heap_size[:max]} -XX:MaxPermSize=#{params[:MaxPermSize]}/" #{file}.old > #{file}
		rm -f #{file}.old
		chmod 0755 #{file}
	EOH
	user	"titan"
	group	"titan"
	cwd "/usr/local/titan/bin/"
end
@test "Titan is running" {
  service titan status | grep "Titan + Rexster (com.tinkerpop.rexster.Application) is running with"
}

@test "Cassandra is running" {
  service titan status | grep "Cassandra (org.apache.cassandra.service.CassandraDaemon) is running with pid"
}

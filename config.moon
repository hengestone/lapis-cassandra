config = require "lapis.config"

config "development", ->
  port 8080
  cassandra ->
    host "127.0.0.1"
    keyspace "lapis-test"

config "production", ->
  port 80
  num_workers 4
  code_cache "on"
  cassandra ->
    host "127.0.0.1"
    keyspace "lapis-test"

config = require "lapis.config"

config "development", ->
  port 8080
  mongodb ->
    host "127.0.0.1"
    port 27017
    database "lapis_mongo"

config "production", ->
  port 80
  num_workers 4
  code_cache "on"
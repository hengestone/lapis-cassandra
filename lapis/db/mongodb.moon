cbson = require("cbson")
config = require("lapis.config").get!
moongoo = require("resty.moongoo")
unless config.mongodb
  error "Mongodb configuration is missing"

database_name = config.mongodb.database

get_default_config = ->
  host = config.mongodb.host or "127.0.0.1"
  port = config.mongodb.port or 27017
  return { host, port }

get_connection = ->
  mg, err = moongoo.new("mongodb://127.0.0.1/?w=0")
  if not mg
    error(err)

  return mg

get_database = () ->
  mg = get_connection()
  db = mg\db("test")
  return db

get_collection = (collection_name) ->
  db = get_database!
  col = db\collection(collection_name)
  return col

:get_collection
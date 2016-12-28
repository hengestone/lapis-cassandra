cbson = require("cbson")
config = require("lapis.config").get!
moongoo = require("resty.moongoo")
unless config.mongodb
  error "Mongodb configuration is missing"

database_name = config.mongodb.database

get_uri = ->
  host = config.mongodb.host or "127.0.0.1"
  port = config.mongodb.port or 27017
  wk = config.mongodb.wk or 0
  return "mongodb://#{host}:#{port}/?wk=#{wk}"

get_connection = ->
  mg, err = moongoo.new(get_uri!)
  if not mg
    error(err)

  return mg

get_database = () ->
  mg = get_connection()
  db = mg\db(database_name)
  return db

get_collection = (collection_name) ->
  db = get_database!
  col = db\collection(collection_name)
  return col

:get_collection
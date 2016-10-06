config = require("lapis.config").get!
unless config.mongodb
  error "Mongodb configuration is missing"

database_name = config.mongodb.database

get_default_config = ->
  host = config.mongodb.host or "127.0.0.1"
  port = config.mongodb.port or 27017
  return { host, port }

get_connection = ->
  mongol = require("resty.mongol")
  conn = mongol\new!
  ok,err = conn\connect(unpack(get_default_config!))
  unless err
    return conn
  error("Cannot connect to mongodb server")

get_database = () ->
  conn = get_connection()
  return conn\new_db_handle(database_name)

get_collection = (collection_name) ->
  db = get_database!
  return db\get_col collection_name

insert = (collection_name, docs) ->
  col = get_collection collection_name
  return col\insert docs

find_one = (collection_name, query, returnfields) ->
  col = get_collection collection_name
  return col\find_one(query, returnfields)

:insert, :find_one
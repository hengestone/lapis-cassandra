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

--
--

get_collection = (collection_name) ->
  db = get_database!
  col = db\collection(collection_name)
  return col

drop_collection = (collection_name) ->
  col = get_collection(collection_name)
  return col\drop!

find_one = (collection_name, query, fields) ->
  col = get_collection(collection_name)
  doc, err = col\find_one query, fields
  return doc, err

map_reduce = (collection_name, map, reduce, flags) ->
  col = get_collection(collection_name)
  doc_or_collection, err = col\map_reduce map, reduce, flags
  return doc_or_collection, err

{ 
  :drop_collection
  :find_one
  :get_collection, :map_reduce
}
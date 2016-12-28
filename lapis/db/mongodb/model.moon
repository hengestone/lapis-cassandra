import BaseModel from require "lapis.db.base_model"
import OffsetPaginator from require "lapis.db.mongodb.pagination"
mongodb = require("lapis.db.mongodb")

class Model extends BaseModel
  @collection: => 
    unless @_col
      @_col = mongodb.get_collection(@@table_name!)
    return @_col

  @count: (query) => 
    cur = @collection!\find query
    cur\count!

  @create: (doc) =>
    @collection!\insert doc

  @find: (query, returnfields) =>
    @collection!\find_one query, returnfields

  @paginated: (...) =>
    OffsetPaginator @, ...

  @select: (query, opts) =>
    cur, v, c =  @_get_cursor query
    return cur\all!

  @_get_cursor: (query, fields) =>
    cur = @collection!\find query, fields
    return cur

  @_col = false

:Model
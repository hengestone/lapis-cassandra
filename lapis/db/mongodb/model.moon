import BaseModel from require "lapis.db.base_model"
import OffsetPaginator from require "lapis.db.mongodb.pagination"
mongodb = require("lapis.db.mongodb")

class Model extends BaseModel
  @collection: => 
    unless @_col
      @_col = mongodb.get_collection(@@table_name!)
    return @_col

  @count: (query) => @collection!\count query
  
  @create: (docs) =>
    @collection!\insert docs

  @find: (query, returnfields) =>
    @collection!\find_one query, returnfields

  @paginated: (...) =>
    OffsetPaginator @, ...

  @select: (query, opts = {}) =>
    cur = @_get_cursor query, {a: "b"}, 2
    {k,v for k,v in cur\pairs!}

  @_get_cursor: (query, opts = {}) =>
    return @collection!\find query, {a: "b"}, 2
    
  @_col = false

:Model
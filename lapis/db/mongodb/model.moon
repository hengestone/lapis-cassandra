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

  @select: (query, opts = {}) =>
    cur, v, c = @collection!\query query, nil, 2
    return v
    --cur = @_get_cursor query, {a: "b"}, 2
    --{k,v for k,v in cur\pairs!}

  @_get_cursor: (query, opts = {}) =>
    return @collection!\find query, {a: "b"}, 2
    
  @_col = false

:Model
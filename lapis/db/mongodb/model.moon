import BaseModel from require "lapis.db.base_model"

class Model extends BaseModel
  @db = require "lapis.db.mongodb"

  @create: (docs) =>
    @db.insert @@table_name!, docs

  @find: (query, returnfields) =>
    @db.find_one @@table_name!, query, returnfields

:Model
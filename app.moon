lapis = require "lapis"
Model = require("lapis.db.mongodb.model").Model

class MyModel extends Model
  @table_name: => "test_collection"

class extends lapis.Application
  "/": =>
    m = MyModel\create({{a: "b"}})
    m = MyModel\create({{a: "b"}})
    

    return {
      json: MyModel\find {a: "b"}
    }

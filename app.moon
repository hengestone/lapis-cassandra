lapis = require "lapis"
Model = require("lapis.db.mongodb.model").Model

response = (json) ->
  json: json

class MyModel extends Model
  @table_name: => "test_collection"

class extends lapis.Application
  "/": =>
    m = MyModel\create({a: "b"})
    
    return {
      json: MyModel\find {}
    }

  "/count": => response MyModel\count({})

  "/select": =>
    docs = MyModel\select {a: "b"}
    response docs

  "/pagination": =>
    paginated = MyModel\paginated {a: "b"}

  "/pagination_count": =>
    paginated = MyModel\paginated {a: "b"}
    response paginated\total_items!

  "/pagination_num_pages": =>
    paginated = MyModel\paginated {a: "b"}
    response paginated\num_pages!

  "/pagination_page": =>
    paginated = MyModel\paginated {a: "b"}
    response paginated\get_page 1

  "/query": =>
    response MyModel\select({a: "b"})

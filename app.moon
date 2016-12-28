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

  "/delete": =>
    m = MyModel\create({tdelete: "tdeletev"})
    doc = MyModel\find {tdelete: "tdeletev"}
    num, err = doc\delete!
    doc2 = MyModel\find {tdelete: "tdelete"}
    
    response {doc: doc, doc2: doc2}

  "/select": =>
    docs = MyModel\select {}
    response docs

  "/pagination": =>
    page = @params.page or 1
    paginated = MyModel\paginated {}
    pagination = {
      total_items: paginated\total_items!
      :page
      num_pages: paginated\num_pages!
      items: paginated\get_page page
    }
    
    response pagination

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

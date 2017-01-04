import Model from require "lapis.db.mongodb.model"
db = require "lapis.db.mongodb"

class LapisMongo extends Model

describe "lapis.db.mongodb.model", ->
  it "should get assert", ->
    assert.true true

  it "should get table name", ->
    assert.same "lapis_mongo", LapisMongo\table_name!

  it "should get collection count", ->
    assert.same 1000, LapisMongo\count!

  it "should get pagination total pages", ->
    paginated = LapisMongo\paginated {}
    assert.same paginated\num_pages!, 100

  it "should get pagination count", ->
    paginated = LapisMongo\paginated {}
    assert.same paginated\total_items!, 1000

  it "should get pagination page 1 & 100", ->
    paginated = LapisMongo\paginated {}
    page = paginated\get_page(1)
    assert.same page[2].email, "jcastillo1@facebook.com"
    

  it "should perform a map reduce", ->
    map = "function() { emit(this.gender, 1); }"
    reduce = "function(key, values) { return Array.sum(values); }"
    doc_or_new_col, err = db.map_reduce "lapis_mongo", map, reduce
    expected = {
      { _id: "Female", value: 491 },
      { _id: "Male", value: 509 } 
    }
    
    assert.same doc_or_new_col, expected

  it "should find_one doc", ->
    doc = db.find_one "lapis_mongo", {
      gender: "Female"
    }

    assert.is_not_nil doc._id

  it "should get create a model", ->
    id = LapisMongo\create {
      myName: "Criztian"
      myLastname: "Haunsen"
    }

    assert.same type(id), "table"

  it "should find a model", ->
    doc = LapisMongo\find {
      myName: "Criztian"
    }

    assert.is_not_nil doc._id


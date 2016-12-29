import Model from require "lapis.db.mongodb.model"

class LapisMongo extends Model

describe "lapis.db.mongodb.model", ->
  it "should get assert", ->
    assert.true true

  it "should get table name", ->
    assert.same "lapis_mongo", LapisMongo\table_name!

  it "should get collection count", ->
    assert.same 1000, LapisMongo\count!

  it "should get create a model", ->
    id = LapisMongo\create {
      myName: "Criztian"
      myLastname: "Haunsen"
    }

    assert.same type(id), "table"

  it "should get find a model", ->
    doc = LapisMongo\find {
      myName: "Criztian"
    }

    assert.is_not_nil doc._id
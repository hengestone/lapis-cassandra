import Model from require "lapis.db.mongodb.model"

describe "lapis.db.mongodb.model", ->
  it "should get assert", ->
    assert.true true

  it "should get table name", ->
    assert.same "banned_users", (class BannedUsers extends Model)\table_name!
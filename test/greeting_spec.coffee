assert = require "assert"
Greeting = require("../lib/greeting").Greeting

describe "Greeting", ->
  it "should say hello", ->
    assert.equal("hello", new Greeting().greet())

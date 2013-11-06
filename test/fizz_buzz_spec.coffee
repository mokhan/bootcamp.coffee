should = require('chai').should()
FizzBuzz = require('../src/fizz_buzz')

describe "FizzBuzz", ->

  beforeEach ->
    @sut = new FizzBuzz

  describe "when given a number that is evenly divisible by 3", ->
    it "returns Fizz", ->
      @sut.run(3).should.equal("Fizz")

  describe "when given a number that is evenly divisible by 5", ->
    it "returns Buzz", ->
      @sut.run(5).should.equal("Buzz")

  describe "when given a number that is evenly divisible by 3 and 5", ->
    it "returns FizzBuzz", ->
      @sut.run(15).should.equal("FizzBuzz")

  describe "when given a number that is not evenly divisible by 3 or 5", ->
    it "returns nothing", ->
      @sut.run(16).should.equal("")

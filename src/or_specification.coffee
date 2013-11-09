Module = require('./module')
Specification = require('./specification')

module.exports = class OrSpecification extends Module
  @include Specification

  constructor: (left, right) ->
    @left = left
    @right = right

  matches: (item) ->
    @left.matches(item) || @right.matches(item)

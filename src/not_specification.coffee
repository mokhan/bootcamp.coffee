Module = require('./module')
Specification = require('./specification')

module.exports = class NotSpecification extends Module
  @include Specification

  constructor: (other) ->
    @other = other

  matches: (item) ->
    !@other.matches(item)


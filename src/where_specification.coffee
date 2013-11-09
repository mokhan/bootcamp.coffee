Module = require('./module')
Specification = require('./specification')

module.exports = class WhereSpecification extends Module
  @include Specification

  constructor: (condition) ->
    @condition = condition

  matches: (item) ->
    for key in Object.keys(@condition)
      return false if item[key] != @condition[key]
    return true

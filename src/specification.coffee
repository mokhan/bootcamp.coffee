module.exports = class OrSpecification
  constructor: (left, right) ->
    @left = left
    @right = right

  matches: (item) ->
    @left.matches(item) || @right.matches(item)

module.exports = class WhereSpecification
  constructor: (condition) ->
    @condition = condition

  matches: (item) ->
    for key in Object.keys(@condition)
      return false if item[key] != @condition[key]
    return true

  or: (other_specification) ->
    new OrSpecification(this, other_specification)


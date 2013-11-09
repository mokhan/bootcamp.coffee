module.exports = class Movie
  constructor: (attributes) ->
    @title = attributes['title']
    @studio = attributes['studio']
    @year_published = attributes['year_published']

  equals: (other) ->
    @title == other["title"]

  @where: (condition) ->
    new WhereSpecification(condition)

class OrSpecification
  constructor: (left, right) ->
    @left = left
    @right = right

  matches: (item) ->
    @left.matches(item) || @right.matches(item)

class WhereSpecification
  constructor: (condition) ->
    @condition = condition

  matches: (item) ->
    for key in Object.keys(@condition)
      return false if item[key] != @condition[key]
    return true

  or: (other_specification) ->
    new OrSpecification(this, other_specification)


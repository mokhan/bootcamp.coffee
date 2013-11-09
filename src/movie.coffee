module.exports = class Movie
  constructor: (attributes) ->
    @title = attributes['title']
    @studio = attributes['studio']
    @year_published = attributes['year_published']

  equals: (other) ->
    @title == other["title"]

  @where: (condition) ->
    new WhereSpecification(condition)

class WhereSpecification
  constructor: (condition) ->
    @condition = condition

  matches: (item) ->
    for key in Object.keys(@condition)
      item[key] == @condition[key]



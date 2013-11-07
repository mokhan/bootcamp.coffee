module.exports = class Movie
  constructor: (attributes) ->
    @title = attributes['title']
    @studio = attributes['studio']
    @year_published = attributes['year_published']

  equals: (other) ->
    @title == other["title"]

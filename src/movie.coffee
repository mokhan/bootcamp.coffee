module.exports = class Movie
  constructor: (attributes) ->
    @title = attributes['title']

  equals: (other) ->
    @title == other["title"]

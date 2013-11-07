module.exports = class MovieLibrary
  constructor: ->
    @movies = []

  add: (movie) ->
    @movies.push(movie) unless @contains(movie)

  total_count: ->
    @movies.length

  contains: (other_movie) ->
    result = false
    @each (movie) =>
      result ||= (movie.title == other_movie.title)
    result

  each: (visitor) ->
    for movie in @movies
      visitor(movie)


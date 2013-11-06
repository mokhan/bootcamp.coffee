module.exports = class MovieLibrary
  constructor: ->
    @movies = []

  add: (movie) ->
    @movies.push(movie) unless movie in @movies

  total_count: ->
    @movies.length

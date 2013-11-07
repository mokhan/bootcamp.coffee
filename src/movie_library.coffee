Enumerable = 
  any: (predicate) ->
    result = false
    @each (item) =>
      result = predicate(item)
      return if result
    result

moduleKeywords = ['extended', 'included']

class Module
  @extend: (object) ->
    for key, value of object when key not in moduleKeywords
      @[key] = value

    object.extended?.apply(@)
    this

  @include: (object) ->
    for key, value of object when key not in moduleKeywords
      @::[key] = value

    object.included?.apply(@)
    this

module.exports = class MovieLibrary extends Module
  @include Enumerable
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


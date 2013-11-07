Enumerable =
  any: (predicate) ->
    result = false
    @each (item) =>
      result = predicate(item)
      return if result
    result

  includes: (other_item) ->
    result = false
    @each (item) =>
      result ||= (item == other_item || item.equals(other_item))
    result

moduleKeywords = ['extended', 'included']

class Module
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
    @movies.push(movie) unless @includes(movie)

  count: ->
    @movies.length

  each: (visitor) ->
    for movie in @movies
      visitor(movie)


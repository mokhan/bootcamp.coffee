Studio = require('./studio')
Module = require('./module')
Enumerable = require('./enumerable')

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

  sort_by_title_ascending: ->
    @movies.sort (x, y) ->
      return 1 if x.title > y.title
      return -1 if x.title < y.title
      return 0

  sort_by_title_descending: ->
    @movies.sort (y, x) ->
      return 1 if x.title > y.title
      return -1 if x.title < y.title
      return 0

  sorted_by_year_published: ->
    @movies.sort (x, y) ->
      x.year_published - y.year_published

  sorted_by_year_published_descending: ->
    @movies.sort (x, y) ->
      y.year_published - x.year_published

  sorted_by_studio_rankings_then_by_year_published: (rankings) ->
    @movies.sort (x, y) =>
      result = rankings.indexOf(x.studio) - rankings.indexOf(y.studio)
      if result == 0 then (x.year_published - y.year_published) else result

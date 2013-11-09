module.exports = Enumerable =
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

  find_all: (predicate) ->
    results = []
    @each (item) =>
      results.push(item) if predicate(item)
    results

  all: (specification) ->
    @find_all (movie) -> 
      specification.matches(movie)



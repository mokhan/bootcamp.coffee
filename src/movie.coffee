module.exports = class Movie
  constructor: (attributes) ->
    @title = attributes['title']
    @studio = attributes['studio']
    @year_published = attributes['year_published']

  equals: (other) ->
    @title == other["title"]

  @by: (studio) ->
    console.log(studio)
    new StudioSpecification(studio)

class StudioSpecification
  constructor: (studio) ->
    @studio = studio

  matches: (movie) ->
    @studio == movie.studio

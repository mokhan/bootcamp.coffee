Module = require('./module')
Criteria = require('./criteria')

module.exports = class Movie extends Module
  @extend Criteria

  constructor: (attributes) ->
    @title = attributes['title']
    @studio = attributes['studio']
    @year_published = attributes['year_published']

  equals: (other) ->
    @title == other["title"]

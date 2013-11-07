should = require('chai').should
MovieLibrary = require('../src/movie_library')
Movie = require('../src/movie')
Studio = require('../src/studio')

describe "MovieLibrary", ->
  beforeEach ->
    @sut = new MovieLibrary
    @shawshank_redemption = new Movie(title: "The Shawshank Redemption", studio: Studio.CastleRock, year_published: 1994)
    @chasing_amy = new Movie(title: "Chasing Amy", studio: Studio.MiramaxFilms, year_published: 1997)
    @man_on_fire = new Movie(title: "Man on Fire", studio: Studio.RegencyEnterprises, year_published: 2004)
    @toy_story = new Movie(title: "Toy Story", studio: Studio.Pixar, year_published: 1995)
    @up = new Movie(title: "Up", studio: Studio.Pixar, year_published: 2006)
    @cars = new Movie(title: "Cars", studio: Studio.Pixar, year_published: 2009)
    @monsters_inc = new Movie(title: "Monsters Inc.", studio: Studio.Pixar, year_published: 2001)
    @fantasia = new Movie(title: "Fantasia", studio: Studio.Disney, year_published: 1940)
    @dumbo = new Movie(title: "Dumbo", studio: Studio.Disney, year_published: 1941)
    @pinocchio = new Movie(title: "Pinocchio", studio: Studio.Disney, year_published: 1940)
    @all_movies = [@shawshank_redemption, @chasing_amy, @man_on_fire, @toy_story, @up, @cars, @monsters_inc, @fantasia, @dumbo, @pinocchio]

  context "when adding a movie to the library", ->
    it "increases the total number of movies in the library", ->
      @sut.add(@shawshank_redemption)
      @sut.add(@chasing_amy)
      @sut.total_count().should.equal(2)

    it "does not allow duplicate movies into the library", ->
      @sut.add(@man_on_fire)
      @sut.add(@man_on_fire)
      @sut.total_count().should.equal(1)

    it "does not add two movies that have the same title (logically the same)", ->
      @sut.add(new Movie(title: 'old school'))
      @sut.add(new Movie(title: 'old school'))
      @sut.total_count().should.equal(1)

  context "any?", ->
    it "returns true when something matches", ->
      @sut.add(new Movie(title: 'old school'))
      @sut.add(new Movie(title: 'old school'))
      result = @sut.any (movie) ->
        movie.title == 'old school'

      result.should.equal(true)



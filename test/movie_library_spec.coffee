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
      @sut.count().should.equal(2)

    it "does not allow duplicate movies into the library", ->
      @sut.add(@man_on_fire)
      @sut.add(@man_on_fire)
      @sut.count().should.equal(1)

    it "does not add two movies that have the same title (logically the same)", ->
      @sut.add(new Movie(title: 'old school'))
      @sut.add(new Movie(title: 'old school'))
      @sut.count().should.equal(1)

  context "any?", ->
    it "returns true when something matches", ->
      @sut.add(new Movie(title: 'old school'))
      @sut.add(new Movie(title: 'old school'))
      result = @sut.any (movie) ->
        movie.title == 'old school'

      result.should.equal(true)

  context "searching for movies", ->
    beforeEach ->
      for movie in @all_movies
        @sut.add(movie)

    it "can find all pixar movies", ->
      results = @sut.all(Movie.where(studio: Studio.Pixar))
      results.should.include(@toy_story)
      results.should.include(@up)
      results.should.include(@cars)
      results.should.include(@monsters_inc)


    it 'finds all movies published by pixar or disney', ->
       results = @sut.all(Movie.where(studio: Studio.Pixar).or(Movie.where(studio: Studio.Disney)))
       results.length.should.equal(7)
       results.should.include(@toy_story)
       results.should.include(@up)
       results.should.include(@cars)
       results.should.include(@monsters_inc)
       results.should.include(@fantasia)
       results.should.include(@dumbo)
       results.should.include(@pinocchio)

     it "finds all movies not published by pixar", ->
       results = @sut.find_movies_not_published_by_pixar()
       results.length.should.equal(6)
       results.should.include(@fantasia)
       results.should.include(@dumbo)
       results.should.include(@pinocchio)
       results.should.include(@shawshank_redemption)
       results.should.include(@chasing_amy)
       results.should.include(@man_on_fire)

     it "finds all movies released after 2004", ->
       results = @sut.find_movies_released_after_2004()
       results.length.should.equal(2)
       results.should.include(@up)
       results.should.include(@cars)

     it "finds all movies released between 1982 and 2003 - inclusive", ->
       results = @sut.find_movies_released_between_1982_and_2003()
       results.length.should.equal(4)
       results.should.include(@shawshank_redemption)
       results.should.include(@chasing_amy)
       results.should.include(@toy_story)
       results.should.include(@monsters_inc)

  context "sorting movies", ->
    beforeEach ->
      @sut.add(movie) for movie in @all_movies

    it "sorts all movies by title ascending", ->
      expected_order = [ @cars, @chasing_amy, @dumbo, @fantasia, @man_on_fire, @monsters_inc, @pinocchio, @shawshank_redemption, @toy_story, @up ]
      results = @sut.sort_by_title_ascending()
      results.should.eql(expected_order)

    it "sorts all movies by title descending", ->
      expected_order = [ @up, @toy_story, @shawshank_redemption, @pinocchio, @monsters_inc, @man_on_fire, @fantasia, @dumbo, @chasing_amy, @cars ]
      results = @sut.sort_by_title_descending()
      results.should.eql(expected_order)

    it 'Sorts all movies by descending release date', ->
      expected_order = [@cars, @up, @man_on_fire, @monsters_inc, @chasing_amy, @toy_story, @shawshank_redemption, @dumbo, @fantasia, @pinocchio ]
      results = @sut.sorted_by_year_published_descending()
      results.should.eql(expected_order)

    it 'Sorts all movies by ascending release date', ->
      expected_order = [ @fantasia, @pinocchio, @dumbo, @shawshank_redemption, @toy_story, @chasing_amy, @monsters_inc, @man_on_fire, @up, @cars ]
      results = @sut.sorted_by_year_published()
      results.should.eql(expected_order)

    it 'Sorts all movies by preferred studios and release date ascending', ->
      #rankings: Pixar, Disney, CastleRock, MiramaxFilms, RegenceyEnterprises
      rankings = [Studio.Pixar, Studio.Disney, Studio.CastleRock, Studio.MiramaxFilms, Studio.RegencyEnterprises]
      expected_order = [ @toy_story, @monsters_inc, @up, @cars, @fantasia, @pinocchio, @dumbo, @shawshank_redemption, @chasing_amy, @man_on_fire ]
      results = @sut.sorted_by_studio_rankings_then_by_year_published(rankings)
      results.should.eql(expected_order)


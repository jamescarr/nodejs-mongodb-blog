routes = require "../routes/index"
require "should"

describe "routes", ->
  describe "index", ->
    it "should display index with posts", ->
      req = null
      res = 
        render: (view, vars) ->
          view.should.equal "index"
          vars.title.should.equal "My Coffeepress Blog"
      routes.index(req, res)

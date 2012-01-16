express  = require "express"
mongoose = require "mongoose"
routes   = require "./routes"
app = module.exports = express.createServer()
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure "development", ->
  mongoose.connect 'mongodb://localhost/coffeepress-dev'
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

app.get "/", routes.index
app.get "/post/new", routes.newPost
app.post "/post/new", routes.addPost
app.get "/post/:id", routes.viewPost

app.listen 3000
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env

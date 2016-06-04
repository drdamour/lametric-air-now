express  = require 'express'
router = express.Router()
marko = require 'marko'

module.exports = (app) ->
  app.use '/', router

indexTemplate = marko.load require.resolve '../views/index.marko'
    indexTemplate.render
      $global: locals: req.app.locals
      title: 'Generator-Express MVC'
      articles: articles
    , res

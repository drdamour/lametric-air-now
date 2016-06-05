express  = require 'express'
router = express.Router()
marko = require 'marko'

module.exports = (app) ->
  app.use '/', router


  router.get '/', (req, res) ->
    indexTemplate = marko.load require.resolve '../views/index.marko'
    indexTemplate.render
      $global: locals: req.app.locals
      title: 'Air Quality Now for LaMetric'
    , res

  router.get '/current', (req, res) ->
    res.json
      frames: [
        {
          index: 0
          text: req.param("zip-code")
          icon: "i120"
        },
        {
          index: 1
          text:  req.param("zip-code")
          icon: "i120"

          c: req.header("accept")
          d: req.headers
          e: req.params
        }
      ]


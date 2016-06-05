express  = require 'express'
router = express.Router()
marko = require 'marko'
request = require("request")

module.exports = (app) ->
  app.use '/', router


  router.get '/', (req, res) ->
    indexTemplate = marko.load require.resolve '../views/index.marko'
    indexTemplate.render
      $global: locals: req.app.locals
      title: 'Air Quality Now for LaMetric'
    , res

  router.get '/current', (req, res) ->
    request.get  {
      url: "http://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=#{req.param("zip-code")}&date=2016-06-04&distance=25&API_KEY=#{process.env.AIR_NOW_KEY}"
      json: true
    }, (e, r, body) ->
      console.log body
      console.log e
      res.json
        frames: [
          {
            index: 0
            text: "Air Quality for #{body[0].ReportingArea}, #{body[0].StateCode} (#{req.query("zip-code")})"
            icon: "a2286"
          },
          {
            index: 1
            text: "Air Quality for " + req.query("zip-code")
            icon: "i120"
          },
          {
            index: 2
            text:  req.query("zip-code")
            icon: "i120"
          }
        ]


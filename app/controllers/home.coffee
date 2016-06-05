express  = require 'express'
router = express.Router()
marko = require 'marko'
request = require("request")

moderateIcon = "i120"
skullIcon = "i148"
cloudsIcon = "a2286"

module.exports = (app) ->
  app.use '/', router


  router.get '/', (req, res) ->
    indexTemplate = marko.load require.resolve '../views/index.marko'
    indexTemplate.render
      $global: locals: req.app.locals
      title: 'Air Quality Now for LaMetric'
    , res

  router.get '/current', (req, res) ->
    throw  "zip param required" if not req.query.zip?

    request.get  {
      url: "http://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=#{req.query.zip}&date=2016-06-04&distance=25&API_KEY=#{process.env.AIR_NOW_KEY}"
      json: true
    }, (e, r, body) ->
      throw e if e?

      if body?.length is 0
        res.json
          frames: [
            {
              index: 0
              text: "No results for zip #{req.query.zip}"
              icon: skullIcon
            }
          ]
      else
        res.json
          frames: [
            {
              index: 0
              text: "Air Quality for #{body[0]?.ReportingArea}, #{body[0]?.StateCode} (#{req.query.zip})"
              icon: cloudsIcon
            },
            {
              index: 1
              text: "Air Quality for " + req.query.zip
              icon: moderateIcon
            },
            {
              index: 2
              text:  req.query.zip
              icon: moderateIcon
            }
          ]


express  = require 'express'
router = express.Router()
marko = require 'marko'
request = require("request")

yellowBallIcon = "i120"
greenBallIcon = "i606"
redBallIcon = "i605"
skullIcon = "i148"
cloudsIcon = "a2286"


levelIcons =
  Good: greenBallIcon
  Moderate: yellowBallIcon
  "Unhealthy for Sensitive Groups": yellowBallIcon
  Unhealthy: redBallIcon
  "Very Unhealthy": skullIcon
  Hazardous: skullIcon
  Unavailable: yellowBallIcon


currentUrl = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&distance=25"
forecastUrl = "http://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&distance=25"

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
    zip = req.query.zip
    today = "2016-06-04"
    tomorrow = '2016-06-05'

    request.get  {
      url: "#{forecastUrl}&date=#{today}&zipCode=#{zip}&API_KEY=#{process.env.AIR_NOW_KEY}"
      json: true
    }, (e, r, forecast) ->
      throw e if e?

      request.get  {
        url: "#{currentUrl}&date=#{today}&zipCode=#{zip}&API_KEY=#{process.env.AIR_NOW_KEY}"
        json: true
      }, (e, r, current) ->
        throw e if e?

        if forecast?.length is 0 or current?.length is 0
          res.json
            frames: [
              {
                index: 0
                text: "No results for zip #{zip}"
                icon: skullIcon
              }
            ]
        else
          now = current[0]
          expectedToday = (f for f in forecast when f?.ParameterName is 'O3' and f?.DateForecast.trim() is today)[0]
          expectedTomorrow = (f for f in forecast when f?.ParameterName is 'O3' and f?.DateForecast.trim() is tomorrow)[0]

          res.json
            frames: [
              {
                index: 0
                text: "Air Quality for #{expectedToday.ReportingArea}, #{expectedToday.StateCode} (#{zip})"
                icon: cloudsIcon
              },
              {
                index: 1
                text: "Current AQI #{now.AQI} (#{now?.Category?.Name}) today"
                icon: levelIcons[now?.Category?.Name || "Unavailable"]
              },
              {
                index: 2
                text: "AQI #{expectedToday.AQI} (#{expectedToday?.Category?.Name}) expected today"
                icon: levelIcons[expectedToday?.Category?.Name || "Unavailable"]
              },
              {
                index: 3
                text: "AQI #{expectedTomorrow?.AQI} (#{expectedTomorrow?.Category?.Name}) expected tomorrow"
                icon: levelIcons[faqiForcastTomorrow?.Category?.Name || "Unavailable"]
              },
            ]


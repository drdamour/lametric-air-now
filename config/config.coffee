path     = require 'path'
rootPath = path.normalize __dirname + '/..'
env      = process.env.NODE_ENV || 'development'

config =
  development:
    root: rootPath
    app:
      name: 'lametric-air-now'
    port: 3000

  test:
    root: rootPath
    app:
      name: 'lametric-air-now'
    port: 3000

  heroku:
    root: rootPath
    app:
      name: 'lametric-air-now'
    port: process.env.PORT || 3000

module.exports = config[env]

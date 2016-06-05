[![Build Status](https://travis-ci.org/drdamour/lametric-air-now.svg?branch=master)](https://travis-ci.org/drdamour/lametric-air-now)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/907f896ca2154473b04e55fadaf09df6)](https://www.codacy.com/app/drdamour/lametric-air-now?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=drdamour/lametric-air-now&amp;utm_campaign=Badge_Grade)

# lametric-air-now
[Air Now](https://www.airnow.gov/) air quality reports for [LaMetric](lametric.com) using the [Air Now API](http://.airnowapi.org).  Add it to your LaMetric at http://apps.lametric.com/apps/air_quality_now/439

# Reason
My wife is obsessed with the air quality reports, i tried to put this together a while back but LaMetric had not yet added config params to their UIs and the geo-ip thing seemed to tiring to attempt.

# Tech
I wanted to do a Travis-CI continuous deployment to heroku deal for this, and it seemed like node.js with express was the easiest way to do this, so that's what i did.

# Development
Once i decided on node & express i had been meaning to try out gulp cause i loved SBT so much, so found https://github.com/petecoop/generator-express to build a nice gulp based project, especially since it offered easy CoffeeScript support and i had been hubot'ing as of late.

No idea what all these templating engines are, Jade looked like a lot, i've used mustache and handlebars so wanted to try something new to compare.  Swig looked a lot like handlebars.  Marko seemed interesting with it's "concise" syntax so went with that.

Installed mocha ```npm install -g mocha```
Installed gulp ```npm install -g gulp```

Found the node.js plugin for intellij...but not sure that's what i want.

Tried running gulp

```
/lametric-air-now/node_modules/coffee-script/lib/coffee-script/coffee-script.js:234
      throw helpers.updateSyntaxError(err, stripped, filename);
      ^

/lametric-air-now/app/controllers/home.coffee:9:1: error: unexpected indentation
    indexTemplate.render
^^^^
```

Mucked with that quite a bit to get it to compile and show some stuff

started reading https://docs.travis-ci.com/user/languages/javascript-with-nodejs and setup a .travis.yml, but i don't have any tests and don't even know what those would look like...

switched over to heroku docs at https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction

Downloaded the tool belt and created a new app..but it failed

stumbled upon this https://devcenter.heroku.com/articles/github-integration will need to come back to that

pretty sure i failed cause of port.  Need to have a heroku mode.

that wasn't it, ```heroku logs``` output

```
2016-06-04T22:38:43.616062+00:00 heroku[web.1]: State changed from crashed to starting
2016-06-04T22:38:44.952440+00:00 heroku[web.1]: Starting process with command `npm start`
2016-06-04T22:38:46.836586+00:00 app[web.1]: > lametric-air-now@0.0.1 start /app
2016-06-04T22:38:46.913015+00:00 app[web.1]: Error: Cannot find module 'coffee-script/register'
2016-06-04T22:38:46.913014+00:00 app[web.1]:
2016-06-04T22:38:46.836572+00:00 app[web.1]:
2016-06-04T22:38:46.836591+00:00 app[web.1]: > node app.js
2016-06-04T22:38:46.913016+00:00 app[web.1]:     at Function.Module._resolveFilename (module.js:339:15)
2016-06-04T22:38:46.836592+00:00 app[web.1]:
2016-06-04T22:38:46.912983+00:00 app[web.1]: module.js:341
2016-06-04T22:38:46.913012+00:00 app[web.1]:     throw err;
2016-06-04T22:38:46.913013+00:00 app[web.1]:     ^
2016-06-04T22:38:46.913017+00:00 app[web.1]:     at Function.Module._load (module.js:290:25)
2016-06-04T22:38:46.913017+00:00 app[web.1]:     at Module.require (module.js:367:17)
2016-06-04T22:38:46.913018+00:00 app[web.1]:     at require (internal/module.js:20:19)
2016-06-04T22:38:46.913021+00:00 app[web.1]:     at Function.Module.runMain (module.js:447:10)
2016-06-04T22:38:46.918889+00:00 app[web.1]:
2016-06-04T22:38:46.926196+00:00 app[web.1]: npm ERR! argv "/app/.heroku/node/bin/node" "/app/.heroku/node/bin/npm" "start"
2016-06-04T22:38:46.925807+00:00 app[web.1]: npm ERR! Linux 3.13.0-85-generic
2016-06-04T22:38:46.927316+00:00 app[web.1]: npm ERR! code ELIFECYCLE
2016-06-04T22:38:46.926429+00:00 app[web.1]: npm ERR! node v5.11.1
2016-06-04T22:38:46.927494+00:00 app[web.1]: npm ERR! lametric-air-now@0.0.1 start: `node app.js`
2016-06-04T22:38:46.913018+00:00 app[web.1]:     at Object.<anonymous> (/app/app.js:1:63)
2016-06-04T22:38:46.913019+00:00 app[web.1]:     at Module._compile (module.js:413:34)
2016-06-04T22:38:46.913019+00:00 app[web.1]:     at Object.Module._extensions..js (module.js:422:10)
2016-06-04T22:38:46.913020+00:00 app[web.1]:     at Module.load (module.js:357:32)
2016-06-04T22:38:46.913021+00:00 app[web.1]:     at Function.Module._load (module.js:314:12)
2016-06-04T22:38:46.926980+00:00 app[web.1]: npm ERR! npm  v3.8.6
2016-06-04T22:38:46.927997+00:00 app[web.1]: npm ERR! Failed at the lametric-air-now@0.0.1 start script 'node app.js'.
2016-06-04T22:38:46.928165+00:00 app[web.1]: npm ERR! Make sure you have the latest version of node.js and npm installed.
2016-06-04T22:38:46.927657+00:00 app[web.1]: npm ERR! Exit status 1
2016-06-04T22:38:46.927833+00:00 app[web.1]: npm ERR!
2016-06-04T22:38:46.929129+00:00 app[web.1]: npm ERR!     npm bugs lametric-air-now
2016-06-04T22:38:46.929609+00:00 app[web.1]: npm ERR! There is likely additional logging output above.
2016-06-04T22:38:46.932939+00:00 app[web.1]:
2016-06-04T22:38:46.933161+00:00 app[web.1]: npm ERR! Please include the following file with any support request:
2016-06-04T22:38:46.928491+00:00 app[web.1]: npm ERR! not with npm itself.
2016-06-04T22:38:46.928969+00:00 app[web.1]: npm ERR! You can get information on how to open an issue for this project with:
2016-06-04T22:38:46.928817+00:00 app[web.1]: npm ERR!     node app.js
2016-06-04T22:38:46.928649+00:00 app[web.1]: npm ERR! Tell the author that this fails on your system:
2016-06-04T22:38:46.928330+00:00 app[web.1]: npm ERR! If you do, this is most likely a problem with the lametric-air-now package,
2016-06-04T22:38:46.929287+00:00 app[web.1]: npm ERR! Or if that isn't available, you can get their info via:
2016-06-04T22:38:46.929450+00:00 app[web.1]: npm ERR!     npm owner ls lametric-air-now
2016-06-04T22:38:46.933316+00:00 app[web.1]: npm ERR!     /app/npm-debug.log
2016-06-04T22:38:47.666782+00:00 heroku[web.1]: Process exited with status 1
2016-06-04T22:38:47.681379+00:00 heroku[web.1]: State changed from starting to crashed
```

found this http://stackoverflow.com/questions/6356267/can-i-run-coffeescript-in-heroku which didn't directly answer my question, but made me just move coffee to my dependnecies out of devDependencies and that got it kinda working.

The next problem was port, and i had to modify the config.coffee to have a heroku envvironment config and switch port logic to ```port: process.env.PORT || 3000```.  i fond that port via this answer http://stackoverflow.com/a/18790034/442773 which let me know PORT was an env variable.  finally i had to run ```heroku config:set NODE_ENV=heroku``` so on startup it would use my heroku config



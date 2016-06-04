# lametric-air-now
[Air Now](https://www.airnow.gov/) air quality reports for [LaMetric](lametric.com) using the [Air Now API](http://.airnowapi.org)

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

switched over to herok docs at https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction



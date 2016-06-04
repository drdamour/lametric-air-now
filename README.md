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


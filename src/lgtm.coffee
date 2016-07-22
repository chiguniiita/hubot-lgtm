cheerio = require 'cheerio'
request = require 'request'

module.exports = (robot) ->
  robot.respond /lgtm$/i, (msg) ->
    request.get("http://www.lgtm.in/g", (err, res, body) ->
      $ = cheerio.load body
      msg.send $('#imageUrl').val())
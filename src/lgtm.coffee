# Description
#   A hubot script for LGTM.
#
# Author:
#   chiguniiita

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /lgtm$/i, (msg) ->
    robot.http('http://www.lgtm.in/g').get() (err, res, body) ->
      if err or res.statusCode != 200
        msg.send '/ERROR...'
      else
        $ = cheerio.load body
        msg.send $('#imageUrl').val()

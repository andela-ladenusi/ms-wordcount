# module.exports = (robot) ->
# 	# robot.respond /(.*) andelife/i, (msg) ->
# 	# 	msgType = msg.match[1]
# 	# 	if msgType is "feed"
# 	# 		msg.reply "Bring your plates"
# 	# 	else
# 	# 		msg.reply "Can't #{msgType} you all"
# 	robot.router.post '/hubot/:room', (req, res) ->
# 		# room = req.params.room
# 		# room = "C02SBK0F2"
# 		room   = req.params.room
#     data   = JSON.parse req.body.payload
#     secret = data.secret

#     robot.messageRoom room, "I have a secret: #{secret}"
#     res.send "OK! You're working!"

#   querystring = require('querystring')

# module.exports = (robot) ->
#   robot.router.post "/hubot", (req, res) ->
#     # query = querystring.parse(req._parsedUrl.query)
#     message = req.body.message

#     user = {}
#     # user.room = query.room if query.room
#     user.room = "C02SBK0F2"

#     robot.send(user, message)
#     res.end "said #{message}"

module.exports = (robot) ->
  robot.router.post "/hubot/say", (req, res) ->
    body = req.body
    room = body.room
    message = body.message

    robot.logger.info "Message '#{message}' received for room #{room}"

    envelope = robot.brain.userForId 'broadcast'
    envelope.user = {}
    envelope.user.room = envelope.room = room if room
    envelope.user.type = body.type or 'groupchat'

    if message
      robot.send envelope, message

    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Thanks\n'
    
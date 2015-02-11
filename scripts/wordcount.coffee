module.exports = (robot) ->
	# robot.respond /(.*) andelife/i, (msg) ->
	# 	msgType = msg.match[1]
	# 	if msgType is "feed"
	# 		msg.reply "Bring your plates"
	# 	else
	# 		msg.reply "Can't #{msgType} you all"
	robot.router.post '/hubot/:room', (req, res) ->
		# room = req.params.room
		# room = "C02SBK0F2"
		room   = req.params.room
    data   = JSON.parse req.body.payload
    secret = data.secret

    robot.messageRoom room, "I have a secret: #{secret}"
    res.send "OK! You're working!"
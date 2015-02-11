module.exports = (robot) ->
	# robot.respond /(.*) andelife/i, (msg) ->
	# 	msgType = msg.match[1]
	# 	if msgType is "feed"
	# 		msg.reply "Bring your plates"
	# 	else
	# 		msg.reply "Can't #{msgType} you all"
	robot.router.post '/hubot', (req, res) ->
		# room = req.params.room
		room = "C02SBK0F2"
		user = {}
		user.room = room
    message = "I just deployed to Heroku"
    robot.send(user, message)
    res.send "OK! You're working!"
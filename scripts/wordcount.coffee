module.exports = (robot) ->
	# robot.respond /(.*) andelife/i, (msg) ->
	# 	msgType = msg.match[1]
	# 	if msgType is "feed"
	# 		msg.reply "Bring your plates"
	# 	else
	# 		msg.reply "Can't #{msgType} you all"
	robot.router.post '/hubot', (req, res) ->
		# room = req.params.room
  #   message = req.body.message
  #   robot.messageRoom room, message
    res.send "OK! You're working!"
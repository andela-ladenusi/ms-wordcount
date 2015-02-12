# module.exports = (robot) ->
# 	# robot.respond /(.*) andelife/i, (msg) ->
# 	# 	msgType = msg.match[1]
# 	# 	if msgType is "feed"
# 	# 		msg.reply "Bring your plates"
# 	# 	else
# 	# 		msg.reply "Can't #{msgType} you all"

module.exports = (robot) ->
	robot.router.post "/entries/:room", (req, res) ->
		allUsers = JSON.parse req.body.allEntries
		# message = "Testing payload"
		
		total = 0
		wordCounter = (post) ->
		  return  unless post
		  
		  # Remove all spaces and linebreaks and replace with commas then split the post
		  post = post.replace(/\s+/g, " ").split(" ")
		  post.length

		for user in allUsers
			sum = 0
			# console.log user unless !user.entries.length
			user.entries.map (entry) ->
				sum += wordCounter entry
			console.log '\n' + user.uid + ': ' + sum
			total += sum

		message = "The total wordcount for Andela users today is #{total} words."
		user = {}
		user.room = req.params.room
		robot.send user, message
		console.log 'Total = ' + total
			
		
		res.end '\nThanks for your entries\n'

		# robot.logger.info "this is req body #{message}"
		# robot.logger.info allUsers

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

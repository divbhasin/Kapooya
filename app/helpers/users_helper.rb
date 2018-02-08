module UsersHelper
<<<<<<< HEAD
	def gravatar_for(user, options = { size: 10 })
=======
<<<<<<< HEAD
=======
	def gravatar_for(user, options = { size: 20 })
>>>>>>> 1b625cfcb66b1584f64d6e618ada233743bded68
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://png-5.findicons.com/files/icons/949/token/128/power.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
>>>>>>> origin/master
end

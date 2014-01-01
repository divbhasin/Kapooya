module UsersHelper
	def gravatar_for(user, options = { size: 20 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://pbs.twimg.com/profile_images/1138934293/gravatar-blue-alpha.png"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end

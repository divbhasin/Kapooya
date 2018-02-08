namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
    create_user
    create_posts
    make_relations
  end
end


  def create_user
  admin = User.create!(name:     "Randomass User",
                       email:    "randomass@yahoo.com",
                       password: "foodumb",
                       password_confirmation: "foodumb")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@kapooya.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end
  
  def create_posts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end
  
  def make_relations
    users = User.all
    user = User.first
    following = users
    followers = users
    following.each { |followed| user.follow!(followed)}
    followers.each { |follower| follower.follow!(user)}
  end
	

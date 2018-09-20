class UserMailer < ActionMailer::Base
  default from: "divbest99@gmail.com"
  def followeremail(user)
     @user = user
     @url = "kapooya@example.com"
     mail(to: @user.email, subject: "Kapooya comittee")
     end	
end

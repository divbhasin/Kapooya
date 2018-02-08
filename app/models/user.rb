class User < ActiveRecord::Base
<<<<<<< HEAD
	attr_accessible :name, :email
=======
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
    has_many :microposts, dependent: :destroy
    has_many :comments, foreign_key: "user_id"
    
    has_many :relationships, dependent: :destroy, foreign_key: "follower_id"
    has_many :reverse_relationships, dependent: :destroy, foreign_key: "followed_id", class_name: "Relationship"
    has_many :following, through: :relationships, :source => :followed
    has_many :followers, through: :reverse_relationships, source: :follower

    before_save { |user| user.email = email.downcase }

    before_save :create_remember_token
    
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: true }
    validates :password_confirmation, presence: true

    def feed
        Micropost.from_users_being_followed_by(self)
        # "user_id = ?", id
        # prevents from SQL injection since there is nothing being passed in from the user
        # instead the database will replace the ? with the required id by itself
    end

    def following?(followed)
        relationships.find_by(followed_id: followed.id)
    end

    def follow!(followed)
        self.relationships.create!(followed_id: followed.id)
    end

    def unfollow!(followed)
        relationships.find_by(followed_id: followed.id).destroy
    end

    private
    def create_remember_token
    	self.remember_token = SecureRandom.urlsafe_base64
    end
>>>>>>> origin/master
end

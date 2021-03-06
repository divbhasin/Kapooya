class Micropost < ActiveRecord::Base
	attr_accessible :content
	validates :user_id, presence: true
	belongs_to :user
	default_scope order: 'microposts.created_at DESC'
	# Micropost.order: (created_at: :desc)
	validates :content, presence: true, length: {maximum: 250}
	has_many :comments, foreign_key: "micropost_id", dependent: :destroy

private
  def self.from_users_being_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end

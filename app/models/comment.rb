class Comment < ActiveRecord::Base
	belongs_to :micropost
	belongs_to :user
	validates :commenting, presence: true, length: { maximum: 50 }
	validates :micropost_id, presence: true
	default_scope order: 'comments.created_at DESC'
	validates :user_id, presence: true
end

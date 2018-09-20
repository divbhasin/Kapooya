class Comment < ActiveRecord::Base
	belongs_to :micropost
	belongs_to :user
    validates :user_id, presence: true
    validates :micropost_id, presence: true
	validates :commenting, presence: true, length: { maximum: 50 }
	default_scope order: 'comments.created_at DESC'
end


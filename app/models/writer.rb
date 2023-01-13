class Writer < ApplicationRecord

	has_many :posts

	validates_presence_of :name

	def most_recent_post
		posts.sort_by(&:pubdate).last
	end

end

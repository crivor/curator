class Writer < ApplicationRecord

	has_many :posts

	validates_presence_of :name

	def most_recent_post
		posts.sort_by(&:pubdate).last
	end

	def fetch_new_posts
		begin
			URI.open(feed) do |rss|
				feed = RSS::Parser.parse(rss)
				feed.items.each do |item|
					Post.create(title: item.title, pubdate: item.pubDate, link: item.link, writer_id: id)
				end
			end
		rescue OpenURI::HTTPError
			puts "request failed for #{name}"
		end
	end

end

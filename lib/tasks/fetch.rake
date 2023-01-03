require 'rss'
require 'open-uri'

namespace :fetch do
  desc "fetch new posts"
  task new_posts: :environment do
    # Get an array of all Writers
    writers = Writer.all
    # fetch posts from each writers feed
    writers.each do |writer|
      post_count = 0
      puts "Getting Posts for #{writer.name}"
      URI.open(writer.feed) do |rss|
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          Post.create(title: item.title, pubdate: item.pubDate, link: item.link, writer_id: writer.id)
          #puts "#{item.title}"
          #puts "PubDate: #{item.pubDate}"
          #puts "Link: #{item.link}"
          post_count += 1
        end
        puts "Found #{post_count} articles for #{writer.name}"
      end 
    end
  end

end

require 'rss'
require 'open-uri'

namespace :fetch do
  desc "fetch new posts"
  task new_posts: :environment do
    # Get an array of all Writers
    writers = Writer.where.not(feed: nil)
    # fetch posts from each writers feed
    writers.each do |writer|
      puts "Fetching Posts for #{writer.name} from #{writer.feed}"
      writer.fetch_new_posts
    end
  end

  task substack_posts: :environment do
    writers = Writer.where.not(substack: nil)
    writers.each do |writer|
      puts "Fetching Posts for #{writer.name} from #{writer.feed}"
      writer.fetch_new_posts
    end
  end

end

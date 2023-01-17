require 'rss'
require 'open-uri'

namespace :fetch do
  desc "fetch new posts"
  task new_posts: :environment do
    start_time = Time.now
    writers = Writer.where.not(feed: nil)
    writers.each do |writer|
      puts "Fetching Posts for #{writer.name} from #{writer.feed}"
      writer.fetch_new_posts
    end
    end_time = Time.now
    elapsed_time = end_time - start_time
    puts "task completed in #{elapsed_time} seconds"
  end

  task substack_posts: :environment do
    start_time = Time.now
    writers = Writer.where.not(substack: nil)
    writers.each do |writer|
      puts "Fetching Posts for #{writer.name} from #{writer.feed}"
      writer.fetch_new_posts
    end
    end_time = Time.now
    elapsed_time = end_time - start_time
    puts "task completed in #{elapsed_time} seconds"
  end

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


file = File.read('lib/assets/writers.json')
writers_hash = JSON.parse(file)
writers_hash.each do |w|
	writer = Writer.new(name: w['name'])
	if w['feed']
		writer.feed = w['feed']
	end
	if w['website']
		writer.website = w['website']
	end
	if w['substack']
		writer.substack = w['substack']
	end
	if w['twitter']
		writer.twitter = w['twitter']
	end
	if w['mentor']
		writer.mentor = true
	end
	if w['staff'] 
		writer.staff = true
	end
	writer.save
end
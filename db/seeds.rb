# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

director_hashes = [
  { :name => "Christopher Nolan", :dob => "30/07/1970" },
  { :name => "Francis Ford Coppola", :dob => "07/04/1939" },
  { :name => "Frank Darabont", :dob => "29/01/1959" }
]

Director.destroy_all
director_hashes.each do |d_hash|
  d = Director.new
  d.name = d_hash[:name]
  d.dob = d_hash[:dob]
  d.save
end
puts "There are now #{Director.count} rows in the directors table."


movie_hashes = [
  { :title => "The Dark Knight", :year => 2008, :director_id => Director.find_by_name("Christopher Nolan").id },
  { :title => "The Godfather", :year => 1972, :director_id => Director.find_by_name("Francis Ford Coppola").id },
  { :title => "The Shawshank Redemption", :year => 1994, :director_id => Director.find_by_name("Frank Darabont").id },
  { :title => "The Godfather: Part II", :year => 1974, :director_id => Director.find_by_name("Francis Ford Coppola").id }
]

Movie.destroy_all
movie_hashes.each do |m_hash|
  m = Movie.new
  m.title = m_hash[:title]
  m.year = m_hash[:year]
  m.director_id = m_hash[:director_id]
  m.save
end
puts "There are now #{Movie.count} rows in the movies table."

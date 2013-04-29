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

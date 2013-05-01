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


actor_hashes = [
  { :name => "Christian Bale", :dob => "30/01/1974" },
  { :name => "Al Pacino", :dob => "25/04/1940" },
  { :name => "Tim Robbins", :dob => "16/10/1959" },
  { :name => "Morgan Freeman", :dob => "01/06/1937" }
]

Actor.destroy_all
actor_hashes.each do |a_hash|
  a = Actor.new
  a.name = a_hash[:name]
  a.dob = a_hash[:dob]
  a.save
end
puts "There are now #{Actor.count} rows in the actors table."


role_hashes = [
  { :character_name => "Bruce Wayne",
    :actor_id => Actor.find_by_name("Christian Bale").id,
    :movie_id => Movie.find_by_title("The Dark Knight").id
  },
  { :character_name => "Michael Corleone",
    :actor_id => Actor.find_by_name("Al Pacino").id,
    :movie_id => Movie.find_by_title("The Godfather").id
  },
  { :character_name => "Michael Corleone",
    :actor_id => Actor.find_by_name("Al Pacino").id,
    :movie_id => Movie.find_by_title("The Godfather: Part II").id
  },
  { :character_name => "Andy Dufresne",
    :actor_id => Actor.find_by_name("Tim Robbins").id,
    :movie_id => Movie.find_by_title("The Shawshank Redemption").id
  },
  { :character_name => "Red Redding",
    :actor_id => Actor.find_by_name("Morgan Freeman").id,
    :movie_id => Movie.find_by_title("The Shawshank Redemption").id
  }
]

role_hashes.each do |r_hash|
  r = Role.new
  r.character_name = r_hash[:character_name]
  r.actor_id = r_hash[:actor_id]
  r.movie_id = r_hash[:movie_id]
  r.save
end
puts "There are now #{Role.count} rows in the roles table."

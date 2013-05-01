class Director < ActiveRecord::Base
  def movies
    # This method should return an array of all the movies that belong to this director
    return Movie.where(:director_id => self.id)
  end
end

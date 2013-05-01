class Movie < ActiveRecord::Base
  def director
    # This method should return the single director that this movie belongs to
    return Director.find_by_id(self.director_id)
  end

  def roles
    # This method should return an array of all the roles that belong to this movie
  end
end

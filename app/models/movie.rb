class Movie < ActiveRecord::Base
  def director
    # This method should return the single director that this movie belongs to
    return Director.find_by_id(self.director_id)
  end
end

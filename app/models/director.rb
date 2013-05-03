class Director < ActiveRecord::Base
  has_many :movies
  # def movies
  #   return Movie.where(:director_id => self.id)
  # end

  validates :name, presence: true
end

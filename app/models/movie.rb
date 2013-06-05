class Movie < ActiveRecord::Base
  attr_accessible :title

  has_many :roles
  # def roles
  #   return Role.where(:movie_id => self.id)
  # end

  belongs_to :director
  # def director
  #   return Director.find_by_id(self.director_id)
  # end
  has_many :votes
  has_many :users, :through => :votes

  validates :title, presence: true
  validates :title, :uniqueness => { :scope => :year }
end

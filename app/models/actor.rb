class Actor < ActiveRecord::Base

  attr_accessible :name, :dob

  has_many :roles, dependent: :destroy
  # def roles
  #   return Role.where(:actor_id => self.id)
  # end

  has_many :movies, :through => :roles

  validates :name, presence: true
end

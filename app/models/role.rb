class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie

  validates :character_name, :presence => true
  validates :actor, :presence => true
  validates :movie, :presence => true
end

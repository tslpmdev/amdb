class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  # validates :user_id, uniqueness: true
  # add a custom validation method that will prevent a user from voting more than three times
end

class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
end

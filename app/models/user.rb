class User < ActiveRecord::Base
  validates :username, :uniqueness => { :case_sensitive => false }, presence: true
end

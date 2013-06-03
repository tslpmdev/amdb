class User < ActiveRecord::Base
  validates :username, :uniqueness => { :case_sensitive => false }, presence: true
  # validates :phone_number, length: 10

  # # if they type in (773) 555-4123

  # before_validation :massage_phone_number

  # def massage_phone_number
  #   self.phone_number = self.phone_number.gsub("(", "").gsub(")", "").gsub(" ", "").gsub("-", "")
  # end


  has_secure_password

  has_many :votes, dependent: :destroy

  before_save :downcase_username

  def downcase_username
    self.username = self.username.downcase
  end

end

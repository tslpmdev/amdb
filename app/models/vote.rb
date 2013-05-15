class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  # validates :user_id, uniqueness: true
  # add a custom validation method that will prevent a user from voting more than three times

  validate :user_cannot_vote_more_than_three_times

  def user_cannot_vote_more_than_three_times
    if user.votes.count >= 3
      errors.add(:user_id, "has already voted three times")
    end
  end
end

 #    @vote = Vote.new
 #    @vote.user_id = params[:user_id]
 #    @vote.movie_id = params[:movie_id]

 #    if @vote.save












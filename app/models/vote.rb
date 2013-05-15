class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  validate :user_cannot_vote_more_than_three_times
  validates :user_id, uniqueness: { scope: :movie_id }

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












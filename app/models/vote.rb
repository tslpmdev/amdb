class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  validate :user_cannot_vote_more_than_three_times
  validates :user_id, uniqueness: { scope: :movie_id }

  after_create :increase_movies_number_of_votes
  after_destroy :decrease_movies_number_of_votes
  after_update :decrease_original_movie_vote_count_and_increase_new_movie_vote_count
  after_find :remember_the_original_movie_id

  def decrease_original_movie_vote_count_and_increase_new_movie_vote_count
    o = Movie.find(@original_movie_id)
    o.number_of_votes -= 1
    o.save

    m = self.movie
    m.number_of_votes += 1
    m.save
  end

  def remember_the_original_movie_id
    @original_movie_id = self.movie.id
  end

  def decrease_movies_number_of_votes
    m = self.movie
    m.number_of_votes -= 1
    m.save
  end

  def increase_movies_number_of_votes
    m = self.movie
    m.number_of_votes += 1
    m.save
  end


  def user_cannot_vote_more_than_three_times
    if user.votes.count >= 3
      errors.add(:user_id, "has already voted three times")
    end
  end
end

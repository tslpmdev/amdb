class AddNumberOfVotesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :number_of_votes, :integer, default: 0
  end
end

class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :character_name
      t.integer :actor_id
      t.integer :movie_id
    end
  end
end

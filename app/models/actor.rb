class Actor < ActiveRecord::Base
  def roles
    # This method should return an array of all the roles that belong to this actor
    return Role.where(:actor_id => self.id)
  end
end

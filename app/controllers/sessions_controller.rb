class SessionsController < ApplicationController
  def new
  end

  def create

    u = User.find_by_username(params[:username])
    # Check if a user with the supplied username exists
    # If so, sign them in and redirect back to home page.
    #   Give them a notice "Signed In Successfully."
    # If not, redirect them back to the sign in page with a notice of "Nice try."
  end

  def destroy
  end
end

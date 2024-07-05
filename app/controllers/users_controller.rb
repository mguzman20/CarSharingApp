# frozen_string_literal: true

# user controller
# user controller
class UsersController < ApplicationController
  def profile
    # redirect to login page if not logged in
    @user = User.find(params[:id])
    puts @user
    @reviews = @user.reviews
    return redirect_to new_user_session_url if current_user.nil?

    @publications = Publication.where(user_id: current_user.id).all
    @user = current_user
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
end

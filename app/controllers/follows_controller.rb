class FollowsController < ApplicationController

  def create
    show = Show.find(params[:show_id])
    current_user.follow(show)
    redirect_to root_path
  end

  def destroy
    show = Show.find(params[:show_id])
    current_user.unfollow(show)
    redirect_to root_path
  end

end

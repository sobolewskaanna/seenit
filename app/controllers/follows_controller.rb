class FollowsController < ApplicationController

  def create
    @follow = Follow.create(user_id: current_user.id, show_id: params[:show_id] )
    redirect_to root_path
  end

  def delete
    redirect_to root_path
  end

end

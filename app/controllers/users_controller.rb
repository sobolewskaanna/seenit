class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @follows = Follow.where(user_id: current_user.id)
    if current_user
      render :show
    end
  end

end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if @user.id != current_user.id
      flash[:alert] = "You don't have permission to do that."
      redirect_to root_path
    end

  end

end

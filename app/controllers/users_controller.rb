class UsersController < ApplicationController
  def avatar_params
    params.require(:user).permit(:title, :body, :avatar)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end

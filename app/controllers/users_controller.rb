class UsersController < ApplicationController
  def avatar_params
    params.require(:user).permit(:title, :body, :avatar)
  end

  def show
    @user = User.find(params[:id])
    @total_donations = Confirmation.where(user_id:current_user).count
    authorize @user
  end
end

class UsersController < ApplicationController

  def avatar_params
    params.require(:user).permit(:title, :body, :avatar)
  end
end

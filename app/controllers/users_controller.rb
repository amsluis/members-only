class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.save
  end

  def show
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

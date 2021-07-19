class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(page_params)
    @user.save
  end

  private
  def page_params
    params.require(:page).permit(:first_name, :last_name)
  end
end

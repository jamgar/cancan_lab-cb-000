class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      flash[:alert] = "Name cannot be blank."
      render :new
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end

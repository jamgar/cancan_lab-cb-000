class SessionsController < ApplicationController

  def new
  end

  def create
    if !params[:name] || params[:name].empty?
      flash[:alert] = "User not found"
      render :new       
    else
      user = User.find_by(name: params[:name])
      session[:user_id] = user.id
      redirect_to notes_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end

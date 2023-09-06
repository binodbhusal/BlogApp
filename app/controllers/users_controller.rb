class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to new_user_session_path, notice: 'You have signed out.'
    else
      @user = User.find(params[:id])
      @recent_posts = @user.recent_posts
    end
  end
end

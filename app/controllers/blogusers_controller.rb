class BlogusersController < ApplicationController
  def index
    @current_user = current_bloguser
    @users = Bloguser.where.not(id: @current_user.id).order('RANDOM()')
    @users = [@current_user] + @users
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_bloguser)
      redirect_to new_bloguser_session_path, notice: 'You have signed out.'
    else
      @user = Bloguser.find(params[:id])
      @recent_posts = @user.recent_posts
    end
  end
end

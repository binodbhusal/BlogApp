class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    @posts = if @user
               @user.posts.paginate(page: params[:page],
                                    per_page: 10)
             else
               Post.paginate(
                 page: params[:page], per_page: 10
               )
             end
  end

  def show
    @post = Post.includes(:author, :comments).find(params[:id])
  end
end

class PostsController < ApplicationController
  authorize_resource
  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    posts_query = Post.includes(:author, :comments)
      .order(created_at: :asc)
      .paginate(page: params[:page], per_page: 10)

    @posts = @user ? posts_query.where(author: @user) : posts_query

    Comment.where(post_id: @posts.pluck(:id)).includes(:author)
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'post created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Failed to create post'
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if can?(:destroy, @post)
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted'
    else
      redirect_to users_path, alert: 'You are not authorized to delete this post.'
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

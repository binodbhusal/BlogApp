class PostsController < ApplicationController
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

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

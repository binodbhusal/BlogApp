class PostsController < ApplicationController
  before_action :authenticate_bloguser!, only: [:show]
  before_action :load_and_authorize_resource

  def index
    @user = Bloguser.find(params[:bloguser_id]) if params[:bloguser_id]
    posts_query = Post.includes(:author, :comments)
      .order(created_at: :asc)
      .paginate(page: params[:page], per_page: 10)

    @posts = @user ? posts_query.where(author: @user) : posts_query

    Comment.where(post_id: @posts.pluck(:id)).includes(:author)
  end

  def show
    @current_user = current_bloguser
    @post = Post.find(params[:id])
    @user = @post.author
  end

  def create
    @user = Bloguser.find(params[:bloguser_id])
    @post = current_bloguser.posts.new(post_params)
    if @post.save
      flash[:success] = 'post created successfully'
      redirect_to bloguser_post_path(@user, @post)
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
      redirect_to blogusers_path, alert: 'You are not authorized to delete this post.'
    end
  end

  def new
    @user = Bloguser.find(params[:bloguser_id])
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

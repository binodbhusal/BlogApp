class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author: current_bloguser, post: @post)
    if @like.save
      flash[:success] = 'you liked this post'
    else
      flash[:error] = 'Falied to like the post'
    end
    redirect_to @post
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    @like.destroy
    flash[:success] = 'You unliked this post'
    redirect_to @post
  end
end

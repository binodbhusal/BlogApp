class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to @post
    else
      flash.now[:error] = 'Failed to create comment'
      render 'new'
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

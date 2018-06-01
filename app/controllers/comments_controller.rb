class CommentsController < ApplicationController

  def create
    @post = Post.find(params.require(:post_id))
    @post.comments.create(params.require(:comment).permit(:name, :comment))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params.require(:post_id))
    @comment = @post.comments.find(params.require(:id))
    @comment.destroy
    redirect_to post_path(@post)
  end

end

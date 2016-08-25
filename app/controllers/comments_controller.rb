class CommentsController < ApplicationController

  def create
  	# binding.pry
    comment = Comment.create(comment_params)
    # binding.pry
    redirect_to post_path(comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end

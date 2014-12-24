class CommentsController < ApplicationController

  def create
    @user = User.find(params[:userid])
    @comment = @user.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to [@user]
  end   

    def destroy

      @comment = Comment.find(params[:id])
      # user_id = @comment.commentable_id
      @comment.destroy
      redirect_to(users_path)
    end

    def comment_params
      params.require(:comment).permit(:comment, :userid)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
  end

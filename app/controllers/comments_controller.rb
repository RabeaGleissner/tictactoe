class CommentsController < ApplicationController

  def create
    @user = User.find(params[:userid])
    @comment = @user.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to [@user]
  end   

    # def destroy
    #   track_id = @comment.commentable_id
    #   track = Track.find(track_id)
    #   @comment.destroy
    #   redirect_to [track.user, track.album, track]
    # end

    def comment_params
      params.require(:comment).permit(:comment, :userid)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
  end
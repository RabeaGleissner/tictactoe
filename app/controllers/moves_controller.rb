class MovesController < ApplicationController
  before_action :authenticate_user!

  def index
    @move = Move.all
  end

  def new
    @move = Move.new
  end

  def move_params
    params.require(:move).permit(:user_id, :match_id, :position)
  end
end

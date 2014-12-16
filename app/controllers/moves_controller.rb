class MovesController < ApplicationController


  def index
    @move = Move.all
  end

  def new
    @move = Move.new
  end

  def create
    user = current_user
    match = Match.find(params[:id])
    position = params[:position]
    value = params[:value]

    @move = Move.new(user_id: user.id, match_id: match.id, position: position, value: value)

    if @move.save
      
    else


     
      if position_filled(match_id)
        puts "This field is taken! Choose another one."
      elsif check_if_won
        puts "You won the match!"

      # save completed equals true
      @move.completed = true
      @move.save
      
      # save winner_id and loser_id for matches - need to figure it out
      @match.save
      
    else  
      @move.completed = false
      @move.save
    end
  end




  def move_params
    params.require(:move).permit(:user_id, :match_id, :position)
  end


end

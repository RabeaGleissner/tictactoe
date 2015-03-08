class MatchesController < ApplicationController
  before_action :authenticate_user!


  def index
    winner_matches = Match.where(winner_id: current_user.id)
    @winner_match = winner_matches.order("created_at DESC")
    loser_matches = Match.where(loser_id: current_user.id)
    @loser_match = loser_matches.order("created_at DESC")

    incomplete_match = Match.where(completed: nil)
    matches = incomplete_match.where("player_x_id = ? or player_o_id = ?", current_user.id, current_user.id)
    @incomplete_matches = matches.order("created_at DESC")
  end

  def new
    @match = Match.new
    @users = User.where.not(id: current_user.id).order("name ASC")
  end

  def new_move
    @match = Match.find(params[:id])
    @move = Move.new(user_id: current_user.id, position: params[:position], value: @match.value_for_player(current_user), match_id: @match.id)

    if User.find(@match.player_o_id).name == "Computer" && @move.save 
      @comp_move = Move.new(user_id: @match.player_o_id, position: @match.computer_position.first, value: 'o', match_id: @match.id)

       @comp_move.save if @match.match_active
      redirect_to @match, notice: 'OK, your turn again.' 

    elsif User.find(@match.player_o_id).name != "Computer" && @move.save 
      redirect_to @match, notice: 'Good move.'

    else
      puts "there are errors!"
      render :show
    end

  end

  def create
    @match = Match.new(match_params)
    @match.player_x_id = current_user.id
    @match.save
    redirect_to(@match)
  end


  def show
    @match = Match.find(params[:id])
  end


  private
  def match_params
    params.require(:match).permit(:player_o_id)
  end

end

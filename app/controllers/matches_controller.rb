class MatchesController < ApplicationController
  before_action :authenticate_user!


  def index
  @winner_match = Match.where(winner_id: current_user.id)
  @loser_match = Match.where(loser_id: current_user.id)
  @incomplete_matches = Match.where(completed: nil)


  end

  def new
    @match = Match.new
    @users = User.where.not(id: current_user.id)
  end

def new_move
  @match = Match.find(params[:id])
  @move = Move.new(user_id: current_user.id, position: params[:position], value: @match.value_for_player(current_user), match_id: @match.id)
  if @move.save 
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

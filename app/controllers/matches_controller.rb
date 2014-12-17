class MatchesController < ApplicationController
  before_action :authenticate_user!


  def index
      @winner_match = Match.where(winner_id: current_user.id)
  end

  def new
    @match = Match.new
  end

def new_move
  @match = Match.find(params[:id])
  @moves = @match.moves.new(user_id: current_user.id, position: params[:position], value: @match.value_for_player(current_user))
  if @moves.save
    format.html { redirect_to @match, notice: 'Move list was successfully updated.' }
  else
    puts "there are errors!"
    

    #format.html { redirect_to @match, notice: 'There are errors!' }
  end
  redirect_to @match
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

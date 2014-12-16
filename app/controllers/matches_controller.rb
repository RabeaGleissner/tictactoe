class MatchesController < ApplicationController

  def index
    @match = Match.find(current_user)
  end

  def new
    
  end

  def new_match

    player_x = current_user.id
    player_o = User.first.id #will come from params later

    @match = Match.create(player_x_id: player_x, player_o_id: player_o)

    puts "#{current_user.name}, you are Player x. #{User.first.id}, you are Player o."

  end







private
  def match_params
    params.require(:match).permit(:player_x, :player_o, :winner_id, :loser_id, :completed)
  end

end

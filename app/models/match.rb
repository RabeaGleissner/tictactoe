class Match < ActiveRecord::Base
  has_many :moves
  belongs_to :player_x, class_name: 'User', foreign_key: 'player_x_id'
  belongs_to :player_o, class_name: 'User', foreign_key: 'player_o_id'
  belongs_to :winner, class_name: 'User'

  def value_for_player(user)
    case 
    when user == player_x
      'x'
    when user == player_o
      'o'
    else
      raise 'Invalid player'
    end
  end

  def move_for_position(position)
    moves.find_by(position: position)
  end

  def players_ids
    [player_x_id, player_o_id]
  end

  def match_active
    !winner_id && moves.count < 9
  end

  # def match_over
  #   check_if_drawn || check_if_won
  # end

  def check_if_drawn
    if moves.count == 9 && !winner_id
      self.completed = true
      save
    end
  end

  def check_if_won

    win_arrays = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

    player_x_moves = moves.where(user_id: player_x_id) 
    player_o_moves = moves.where(user_id: player_o_id)

    player_x_positions = player_x_moves.map do
      |move| move.position end
      player_o_positions = player_o_moves.map do
       |move| move.position end

       win_arrays.each do  |win_array| 

         intersection_x = (player_x_positions & win_array)
         intersection_o = (player_o_positions & win_array)

         if intersection_x.count == 3
          self.winner_id = player_x_id
          self.loser_id = player_o_id
          self.completed = true
          save
          return true
        elsif intersection_o.count == 3
          self.winner_id = player_o_id
          self.loser_id = player_x_id
          self.completed = true
          save
          return true
        end
      end
      false
    end

    # def winner_id
    #   if check_if_won == true
    #     winner_id = @match.moves.user_id
    #   end
    # end

    # def loser_id
    #   if check_if_won == true
    #     loser_id = @match.moves.last.user_id
    #   end
    # end


  # def new_match(player_x, player_o)
  #   Match.create(player_x_id: params[:player_x], player_o_id: params[:player_o])
  # end

  # def add_move(user, position, value)
  #   Move.create(user_id: user.id, match_id: id, position: position, value: value)
  # end

end

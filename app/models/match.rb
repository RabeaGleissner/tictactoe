class Match < ActiveRecord::Base
  has_many :moves
  belongs_to :player_x, class_name: 'User', foreign_key: 'player_x_id'
  belongs_to :player_o, class_name: 'User', foreign_key: 'player_o_id'
  belongs_to :winner, class_name: 'User'

  def players_ids
    [player_x_id, player_o_id]
  end

  def match_over
    check_if_drawn || check_if_won
  end

  def check_if_drawn
    if moves.count == 9 
    end

    def check_if_won
      win_array1 = [1,2,3]
      win_array2 = [4,5,6]
      win_array3 = [7,8,9]
      win_array4 = [1,4,7]
      win_array5 = [2,5,8]
      win_array6 = [3,6,9]
      win_array7 = [1,5,9]
      win_array8 = [3,5,7]
      if
        intersection = (@match.moves.map { |move| move.position }&win_array1)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array2)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array3)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array4)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array5)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array6)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array7)
        intersection.count == 3
      elsif
        intersection = (@match.moves.map { |move| move.position }&win_array8)
        intersection.count == 3
      else
        false
      end
    end

    def winner_id
      if check_if_won == true
        winner_id = @match.moves.user_id
      end

      def loser_id
        if check_if_won == true
          loser_id = @match.moves.last.user_id
        end


  # def new_match(player_x, player_o)
  #   Match.create(player_x_id: params[:player_x], player_o_id: params[:player_o])
  # end

  # def add_move(user, position, value)
  #   Move.create(user_id: user.id, match_id: id, position: position, value: value)
  # end



end

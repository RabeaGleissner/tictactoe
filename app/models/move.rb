class Move < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates :position, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 9  }, on: :create
  validates :position, uniqueness: {scope: :match_id}
  validate :value_x_or_o, on: :create
  validate :user_turn
  validate :user_in_this_game
  after_create :check_if_won
  after_create :check_if_drawn
  after_create :match_over

  def value_x_or_o
    errors.add(:value, 'incorrect value') unless ['x', 'o'].include? value
  end

  def user_turn
    if match.moves.any?
      errors.add(:value, 'not your turn') if match.moves.last.user_id == user_id
    end
  end

  def user_in_this_game
    errors.add(:value, 'you are not part of this game') unless match.players_ids.include?(user_id)
  end

  def check_if_won
    puts "Match is won!!!" if match.check_if_won == true
  end

  def check_if_drawn
    puts "It's a draw!!!" if match.check_if_drawn == true
  end

  def match_over
    puts "Match is over!!!" if match.match_over == true
  end

end

class Move < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates :position, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 9  }, on: :create
  validates :position, uniqueness: {scope: :match_id}
  validate :user_turn

  validate :user_in_this_game
  validate :match_active

  after_create :check_if_completed

  def match_active
    if !match.match_active
      errors.add(:base, 'Match is over. *hugs*')
    end
  end

  def check_if_completed
    match.check_if_won
    match.check_if_drawn
  end

  def user_turn
    if match.moves.any?
      errors.add(user.name,", it's not your turn. Sorry. *hugs*") if match.moves.last.user_id == user_id
    end
  end

  def user_in_this_game
    errors.add(:user_id, "Unfortunately you're not part of this game.") unless match.players_ids.include?(user_id)
  end

  def check_if_drawn
    puts "It's a draw!!!" if match.check_if_drawn == true
  end

  def match_over
    puts "Match is over!!!" if match.match_over == true
  end

end

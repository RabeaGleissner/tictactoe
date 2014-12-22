class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, UserImageUploader
  has_many :x_matches, class_name:'Match', foreign_key: :player_x_id
  has_many :o_matches, class_name:'Match', foreign_key: :player_o_id
  has_many :wins, class_name:'Match', foreign_key: :winner
  has_many :moves

  validates :name, presence: true
  validates :name, uniqueness: true

  def total_wins 
    count_users_x_matches(self.id) + count_users_o_matches(self.id)
  end

  def count_users_x_matches(user_id)
    x_matches.where(winner_id: user_id).count
  end

  def count_users_o_matches(user_id)
    o_matches.where(winner_id: user_id).count
  end


end



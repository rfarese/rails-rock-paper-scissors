class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :computer_player
  has_many :game_rounds
end

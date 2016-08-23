class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :computer_player
  has_many :game_rounds

  def user_winner?
    self.user.game_round_wins >= 2
  end

  def computer_player_winner?
    self.computer_player.game_round_wins >= 2
  end

  def winner?
    return self.user if user_winner?
    return self.computer_player if computer_player_winner?
    false
  end
end

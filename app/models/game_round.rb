class GameRound < ActiveRecord::Base
  belongs_to :game

  WINNING_GUESSES = {
    "rock" => "scissors",
    "scissors" => "paper",
    "paper" => "rock"
  }

  def user_winner?
    WINNING_GUESSES[self.game.user.guess] == self.game.computer_player.guess
  end

  def computer_winner?
    WINNING_GUESSES[self.game.computer_player.guess] == self.game.user.guess
  end

  def winner?
    return self.game.user if user_winner?
    return self.game.computer_player if computer_winner?
    false
  end
end

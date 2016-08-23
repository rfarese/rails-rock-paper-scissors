class GameRound < ActiveRecord::Base
  belongs_to :game

  def winner(user_guess, computer_guess)
    winner = "tie"

    winning_guesses = {
      "rock" => "scissors",
      "scissors" => "paper",
      "paper" => "rock"
    }

    if winning_guesses[user_guess] == computer_guess
      winner = "user"
    elsif winning_guesses[computer_guess] == user_guess
      winner = "computer"
    end

    winner
  end
end

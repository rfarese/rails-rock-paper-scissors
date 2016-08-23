class GamesController < ApplicationController

  def create
    if user_signed_in?
      computer_player = ComputerPlayer.new
      computer_player.save
      computer_player.update(game_round_wins: 0)
      current_user.update(game_round_wins: 0)
      @game = Game.new(user_id: current_user.id, computer_player_id: computer_player.id)
      @game.save
      render 'show'
    else
      flash[:notice] = "You must be signed in"
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if user_signed_in?
      @game = Game.find(params[:id])
      @game_round = GameRound.create(game_id: @game.id)
      computer_player = ComputerPlayer.find(@game.computer_player_id)
      current_user.update(guess: params[:guess])
      round_winner = @game_round.winner(params[:guess], computer_player.guess)

      if round_winner == "user"
        current_user.game_round_wins += 1
        # check_for_winner(@game)
      else
        computer_player.game_round_wins += 1
        # check_for_winner(@game)
      end
    end
    render "show"
  end
end

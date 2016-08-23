class GamesController < ApplicationController

  def create
    if user_signed_in?
      computer_player = ComputerPlayer.new
      computer_player.save
      current_user.game_round_wins = 0
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
    @game = Game.find(params[:id])
    @game_round = GameRound.create(game_id: @game.id)
    computer_player = ComputerPlayer.find(@game.computer_player_id)
    round_winner = @game_round.winner(params[:guess], computer_player.guess)
    binding.pry

    if round_winner == "tie"
      render 'show'
    elsif round_winner == "user"
      current_user.game_round_wins += 1
      check_for_winner(@game)
    else
      computer_player.game_round_wins += 1
      check_for_winner(@game)
    end

    binding.pry
  end

  # private
  # def game_params
  #   params_hash = params.require(:book).permit(:title, :author, :description, :cover_photo)
  #   new_hash = { user_id: current_user.id }
  #   new_hash.merge!(params_hash)
  # end
end

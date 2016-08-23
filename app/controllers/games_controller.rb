class GamesController < ApplicationController
  before_action :require_login

  def new_computer_player
    ComputerPlayer.create
  end

  def start_game
    current_user.games_played += 1
    current_user.save 
    Game.create(user_id: current_user.id, computer_player_id: new_computer_player.id)
  end

  def create
    current_user.update(game_round_wins: 0)
    @game = start_game
    render 'show'
  end

  def show
  end

  def update_computer_player(computer_player_id)
    computer_player = ComputerPlayer.find(computer_player_id)
    computer_player.new_guess
    computer_player
  end

  def increment_round_wins(round_winner, computer_player)
    if round_winner == current_user
      current_user.game_round_wins += 1
      current_user.save
      flash[:notice] = "You chose #{current_user.guess}. Computer chose #{computer_player.guess}. You win this round!"
    elsif round_winner == computer_player
      computer_player.game_round_wins += 1
      computer_player.save
      flash[:notice] = "You chose #{current_user.guess}. Computer chose #{computer_player.guess}. Computer wins this round!"
    else
      flash[:notice] = "Its a tie!"
    end
  end

  def game_over(winner)
    if winner == current_user
      flash[:notice] = "You Win!"
      current_user.games_won += 1
      current_user.save
    else
      flash[:notice] = "Computer Wins!"
    end
    redirect_to user_path(current_user)
  end

  def update
    current_user.update(guess: params[:guess])
    @game = Game.find(params[:id])
    @game_round = GameRound.create(game_id: @game.id)
    computer_player = update_computer_player(@game.computer_player_id)
    increment_round_wins(@game_round.winner?, computer_player)

    if @game.winner?
      game_over(@game.winner?)
    else
      render "show"
    end
  end
end

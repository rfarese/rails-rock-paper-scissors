require 'rails_helper'

RSpec.feature "Game is over and a winner is declared;", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario "user wins the game" do
    sign_in(user)
    click_link "New Game"
    user.game_round_wins = 2
    user.save

    click_link "Rock"

    expect(page).to have_content("You Win!")
    expect(page).to have_content("#{user.name} Dashboard")
    expect(page).to have_content("Total Games Played: 1")
    expect(page).to have_content("Total Wins: 1")
  end

  scenario "computer wins the game" do
    sign_in(user)
    click_link "New Game"
    game = Game.all.first
    computer_player = game.computer_player
    computer_player.game_round_wins = 2
    computer_player.save

    click_link "Rock"

    expect(page).to have_content("Computer Wins!")
    expect(page).to have_content("#{user.name} Dashboard")
    expect(page).to have_content("Total Games Played: 1")
    expect(page).to have_content("Total Wins: 0")
  end
end

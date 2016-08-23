require 'rails_helper'

RSpec.feature "User choices 'rock', 'paper', or 'scissors';", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario "user chooses 'rock'" do
    sign_in(user)
    click_link "New Game"
    click_link "Rock"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("rock")
  end

  scenario "user chooses 'paper'" do
    sign_in(user)
    click_link "New Game"
    click_link "Paper"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("paper")
  end

  scenario "user chooses 'scissors'" do
    sign_in(user)
    click_link "New Game"
    click_link "Scissors"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("scissors")
  end
end

require 'rails_helper'

RSpec.feature "User creates multiple guesses;", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario "user chooses 'rock', then 'paper'" do
    sign_in(user)
    click_link "New Game"
    click_link "Rock"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("rock")

    click_link "paper-link"
    new_updated_user = User.all.first

    expect(new_updated_user.guess).to eq("paper")
  end

  scenario "user chooses 'paper', then chooses 'rock'" do
    sign_in(user)
    click_link "New Game"
    click_link "paper-link"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("paper")

    click_link "Rock"
    new_updated_user = User.all.first

    expect(new_updated_user.guess).to eq("rock")
  end

  scenario "user chooses 'scissors', then chooses 'paper'" do
    sign_in(user)
    click_link "New Game"
    click_link "Scissors"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("scissors")

    click_link "paper-link"
    new_updated_user = User.all.first

    expect(new_updated_user.guess).to eq("paper")
  end

  scenario "user chooses 'scissors', then chooses 'rock'" do
    sign_in(user)
    click_link "New Game"
    click_link "Scissors"
    updated_user = User.all.first

    expect(updated_user.guess).to eq("scissors")

    click_link "Rock"
    new_updated_user = User.all.first

    expect(new_updated_user.guess).to eq("rock")
  end
end

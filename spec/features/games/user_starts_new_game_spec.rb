require 'rails_helper'

RSpec.feature "User starts a new game;", type: :feature do

  let(:user) { FactoryGirl.create(:user) }

  scenario "user see 'New Game' link on home page" do
    visit root_path

    expect(page).to have_content("New Game")
  end

  scenario "user successfully starts a new game" do
    sign_in(user)
    click_link "New Game"

    expect(Game.all.size).to eq(1)
  end

  scenario "unauthenticated user recieves an error message when creating a new game" do
    visit root_path
    click_link "New Game"

    expect(page).to have_content("You must be signed in")
    expect(Game.all.size).to eq(0)
  end
end

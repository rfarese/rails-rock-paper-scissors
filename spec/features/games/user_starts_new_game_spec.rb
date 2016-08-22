require 'rails_helper'

RSpec.feature "User starts a new game;", type: :feature do

  scenario "user see 'New Game' link on home page" do
    visit root_path

    expect(page).to have_content("New Game")
  end

  scenario "user successfully starts a new game"

  scenario "unauthenticated user recieves an error message when creating a new game"
end

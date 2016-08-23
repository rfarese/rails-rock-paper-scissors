require 'rails_helper'

RSpec.feature "User creates first guess;", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  # if total wins (user wins + computer player wins) is greater than 3
      # then a winner must be declared and the game is over
      # a winner is added to the Game table in the database
      # if the user has won, their games_won is incremented by 1 in the database
      


  scenario ""
end

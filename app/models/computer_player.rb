class ComputerPlayer < ActiveRecord::Base
  has_many :games

  def new_guess
    self.guess = ["rock", "paper", "scissors"].sample
    self.save
  end
end

class ComputerPlayer < ActiveRecord::Base
  has_many :games

  def guess
    ["rock", "paper", "scissors"].sample
  end
end

class BetDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  enum bet_status: { in_process: 0, loss: 1, won: 2}
end

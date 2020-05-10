class BetDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  enum bet_status: { in_process: 0, loss: 1, won: 2}

  validates :bet_number, :amount, presence: true, inclusion: { in: (1..36) }

  after_create :update_timestamp
  after_create :update_user_balance

  def update_timestamp
  	self.update_column("betting_time", Time.now)
  end

  def update_user_balance
  	self.user.update_balance(-self.amount)
  end
end

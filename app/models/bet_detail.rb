class BetDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  enum bet_status: { in_process: 0, loss: 1, won: 2}

  validates :bet_number, presence: true, inclusion: { in: (1..36) }
  validates :amount, presence: true

  before_create :update_timestamp
  after_create :update_user_balance

  def update_timestamp
  	self.betting_time = Time.now
  end

  def update_user_balance
  	raise ActiveRecord::Rollback unless self.user.update_balance(-self.amount)
  end
end

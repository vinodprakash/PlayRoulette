class Game < ActiveRecord::Base
  belongs_to :dealer
  has_many :bet_details

  enum status: { start: 0, stop: 1, completed: 2}

  validates :thrown_number, inclusion: { in: (1..36) }, allow_nil: true

  after_create :update_timestamp
  after_update :update_status

  def update_timestamp
  	self.update(start_time: Time.now)
  end

  def update_status
  	status = self.changes[:thrown_number].present? ? Game.statuses[:completed] : Game.statuses[:stop]
  	self.update_column("status", status)
  end

end

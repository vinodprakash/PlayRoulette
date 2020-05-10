class Game < ActiveRecord::Base
  belongs_to :dealer
  has_many :bet_details

  enum status: { start: 0, stop: 1, completed: 2}
end

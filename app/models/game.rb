class Game < ActiveRecord::Base
  belongs_to :dealer

  enum status: { start: 0, stop: 1, completed: 2}
end

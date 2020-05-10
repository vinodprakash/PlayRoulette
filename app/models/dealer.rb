class Dealer < ActiveRecord::Base
  belongs_to :casino
  has_many :games

  validates :name, presence: true

  def active_game
  	self.games.start.order(id: :asc).last
  end

  def last_ended_game
  	self.games.stop.order(id: :asc).last
  end

  def no_active_games
  	((self.games.start.size + self.games.stop.size) == 0) ? true : false
  end
end

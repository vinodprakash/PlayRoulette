class Dealer < ActiveRecord::Base
  belongs_to :casino
  has_many :games
end

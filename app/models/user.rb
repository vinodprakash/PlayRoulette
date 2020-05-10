class User < ActiveRecord::Base
	has_one :current_casino, class_name: "Casino", foreign_key: "id"
	has_many :bet_details
end

class Game
	include Mongoid::Document

	field :state, type: String
	field :name, type: String 

	has_many :drawings
end
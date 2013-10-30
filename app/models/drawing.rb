class Drawing
	include Mongoid::Document

	field :number, type: String
	field :numberBig, type: String
	field :date, type: String

	has_many :tickets
	belongs_to :game

	#create a method to concantenate the crazy #'s of the id tag into a string for the ticket drop down menu
	def to_s
		self.game.name + ' ; ' + self.date
	end

end
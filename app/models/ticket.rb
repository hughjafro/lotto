class Ticket #user number
	include Mongoid::Document

	field :number, type: String
	field :numberBig, type: String
	field :date, type: String

	belongs_to :drawing
	belongs_to :user

	# def checkState
	# end

	# def checkGame
	# end

	# def checkNum
	# 	for @num.each do |n| 



end
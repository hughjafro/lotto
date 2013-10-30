class TicketsController < ApplicationController
	# def index
	# 	@tickets = Ticket.find_by(:user_id => current_user.id)
	# end

	def new
		@ticket = Ticket.new
	end

	# def save
	# 	@users = Users.
end
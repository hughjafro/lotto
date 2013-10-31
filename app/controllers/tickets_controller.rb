class TicketsController < ApplicationController
	
	def index
		@tickets = Ticket.all #find_by(:user_id => current_user.id)
	end

	def new
		@ticket = Ticket.new
	end

	def create
		# @ticket = Ticket.create(params[:ticket].permit(:number, :numberBig. :date))
		# redirect_to tickets_url
	end

	# def save
	# 	@users = Users.
end
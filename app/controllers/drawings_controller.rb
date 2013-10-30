class DrawingsController < ApplicationController

	def index
		@drawings = Drawing.all
	end

	def new
		@drawing = Drawing.new
	end

	def create
		@drawing = Drawing.create(params[:drawing].permit(:date, :game_id))
		redirect_to tickets_url
	end



end
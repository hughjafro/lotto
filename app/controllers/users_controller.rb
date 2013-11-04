class UsersController < ApplicationController


	def index
		@users = User.all #find_by(:user_id => current_user.id)
	end

	def new
		@user = User.new
	end


	def create
		@user = User.create(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
		redirect_to tickets_url #:action => "show", :id =>@user._id
	end

	# def save
	# 	@users = Users.
end
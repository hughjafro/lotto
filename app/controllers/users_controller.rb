class UsersController < ApplicationController


	def index
		@users = User.all #find_by(:user_id => current_user.id)
	end

	def new
		@user = User.new
	end


	def create
		@user = User.create(params[:user].permit(:email, :password, :password_confirmation))
		redirect_to users_url #:action => "show", :id =>@user._id
	end

	# def save
	# 	@users = Users.
end
require 'bcrypt'

class User
	include Mongoid::Document

	attr_accessor :password, :password_confirmation

	field :firstName, type: String
	field :lastName, type: String
	field :fullName, type: String
	field :phone, type: String
	field :email, type: String
	field :salt, type: String	
	field :hashed_password, type: String
	field :userNums, type: Integer #This will be an array of 6 numbers
	field :state, type: String
	field :game, type: String


	has_many :tickets

	#Before you create a user, call the hash_password
	before_save :hash_password
	validates :firstName, presence: true
	validates :lastName, presence: true
	validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }
	validates :password, confirmation: true

	def authenticate(password)
		self.hashed_password == BCrypt::Engine.hash_secret(password, self.salt)
	end

	private
	def hash_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
			password = password_confirmation = nil
		end
	end


end
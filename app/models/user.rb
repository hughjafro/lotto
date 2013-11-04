require 'bcrypt'

class User
	include Mongoid::Document

	attr_accessor :password, :password_confirmation

	field :first_name, type: String
	field :last_name, type: String
	field :full_name, type: String
	field :phone, type: String
	field :email, type: String
	field :salt, type: String	
	field :hashed_password, type: String
	field :user_nums, type: Integer #This will be an array of 6 numbers
	field :state, type: String
	field :game, type: String


	has_many :tickets

	#This will tell sus what regions to show on the map
	# has_and_belongs_to_many :ugroups, class_name: "Group",
	# inverse_of: :gusers

	# has_and_belongs_to_many :ugroups, class_name: "Event",
	# inverse_of: :gusers

	has_many :scores

	#Before you create a user, call the hash_password
	before_save :hash_password
	validates :first_name, presence: true
	validates :last_name, presence: true
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
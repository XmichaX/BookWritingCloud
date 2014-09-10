class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :login, :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me

	#Devise: Create a login virtual attribute in the User model
	attr_accessor :login

	has_and_belongs_to_many :books
	has_many :chunks, as: :chunkable

	validates_presence_of :first_name, :last_name, :username
	validates :username, :uniqueness => {:case_sensitive => false}

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["username = :value OR lower(email) = :value", {:value => login}]).first
		else
			where(conditions).first
		end
	end
end

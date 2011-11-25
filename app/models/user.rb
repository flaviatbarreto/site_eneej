class User < ActiveRecord::Base
	
	has_many :events, :dependet => :destroy
	
	attr_accessor :password
	attr_accessible :email, :name, :password, :password_confirmation
	
	validates :email, :uniqueness => true
	validates :name, :presence => true
	validates :password, :presence => true, :confirmation => true
	
	before_save :encrypt_password
	
	def self.authenticate email, password
		user = User.find_by_email(email)
		return user if user && user.has_password?(password)
		nil
	end
	
	def encrypt_password
		self.salt = make_salt if !has_password? password
		self.encrypted_password = encrypt(password)
	end
	
	def encrypt string
		secure_hash("#{string}FLU#{salt}")
	end
	
	def has_password? password
		encrypted_password == encrypt(password)
	end
	
	def secure_hash string
		Digest::SHA2.hexdigest(string)
	end
	
	def make_salt
		secure_hash("#{password}FLA#{Time.now.utc}")
	end
	
end

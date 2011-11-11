class User < ActiveRecord::Base
	
	validates :email, :uniqueness => true
	validates :name, :presence => true
	validates :password, :presence => true
	
	def self.authenticate email, password
		find_by_email_and_password(email,password)
	end
	
end

class SessionsController < ApplicationController
    
	def new
		@user = User.new
	end
	
	def create
		if @user = User.authenticate(params[:email],params[:password])
			session[:user_id] = @user.id
			flash[:alert] = "Bem-vindo " << @user.name
			redirect_to root_path 
		else
			flash[:alert] = "Usuario/Senha nao conferem"
			render :new	
		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end

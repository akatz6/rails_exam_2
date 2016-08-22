class SessionsController < ApplicationController

	def create
		@members = Member.all
		@organization = Organization.new
		@organizations = Organization.all
		@user = User.find_by(user_params)
		if @user.password == params[:user][:password]
			session[:user_id] = @user.id
		else
			flash[:error] = "Invalid email or password"
			redirect_to root_path
		end		
	end 

	def new
		@organization = Organization.new
		@organizations = Organization.all
		@members = Member.all
		@user =  User.find session[:user_id]
	end

	def index
		@members = Member.all
		@organization = Organization.new
		@user = User.find session[:user_id]
		@organizations = Organization.all
		
	end

	def user_params
		params.require(:user).permit(:email)
	end
end

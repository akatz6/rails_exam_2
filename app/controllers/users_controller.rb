class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def create
		@user = User.create( user_params)
		if @user.valid?
			flash[:success] = "Successfully registered, please log in"
			redirect_to root_path
		else
			flash[:error] = @user.errors.full_messages
			redirect_to root_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end

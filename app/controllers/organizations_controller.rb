class OrganizationsController < ApplicationController
	def create
		@member = Member.new
		@person = User.find(session[:user_id])
		@organizer_name = @person.first_name + @person.last_name
		@org = Organization.create(name:params[:organization][:name], description:params[:organization][:description], user:@organizer_name)
		if @org.valid?
			
			Member.create(organization_id:@org.id, first_name:@person.first_name, last_name:@person.last_name)
			redirect_to new_session_path
		else 
			flash[:error] = @org.errors.full_messages
			redirect_to new_session_path
		end
	end

	def show
		@members = Member.all
		@person = User.find(session[:user_id])
		@org = Organization.find(params[:id])
		@is_member = Member.find_by_organization_id_and_first_name_and_last_name(params[:id], @person.first_name, @person.last_name)
	end

	def update
		@person = User.find(session[:user_id])
		Member.create(organization_id:params[:id], first_name:@person.first_name, last_name:@person.last_name)
		redirect_to :back
	end

	def destroy
		@person = User.find(session[:user_id])
		Member.find_by_organization_id_and_first_name_and_last_name(params[:id], @person.first_name, @person.last_name).destroy
		redirect_to :back
	end



	def index
		@user = User.find session[:user_id]
		@organizations = Organization.all
		@org = Organization.new
		@members = Member.all
	end
end

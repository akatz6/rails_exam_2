class AddUserToOrganizationsTable < ActiveRecord::Migration
  def change
  	add_column :organizations, :user, :string 
  end
end

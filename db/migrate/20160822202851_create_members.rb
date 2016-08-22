class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :organization_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end

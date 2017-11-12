class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :phone_number, :string
    add_column :users, :address, :text
    add_column :users, :is_receive, :boolean, default: true
    add_column :users, :intro, :text
  end
end

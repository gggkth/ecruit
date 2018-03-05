class CreateRecruitApplications < ActiveRecord::Migration
  def change
    create_table :recruit_applications do |t|
      t.string :title
      t.string :name
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
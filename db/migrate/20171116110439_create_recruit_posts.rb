class CreateRecruitPosts < ActiveRecord::Migration
  def change
    create_table :recruit_posts do |t|
      t.string :title
      t.text :content
      t.datetime :duedate
      t.integer :recruiter

      t.timestamps null: false
    end
  end
end
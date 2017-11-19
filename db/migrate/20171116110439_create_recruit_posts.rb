class CreateRecruitPosts < ActiveRecord::Migration
  def change
    create_table :recruit_posts do |t|
      t.string :title
      t.text :content
      t.datetime :duedate
      t.string :name

      t.timestamps null: false
    end
  end
end
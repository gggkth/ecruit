class CreateQas < ActiveRecord::Migration
  def change
    create_table :qas do |t|
      t.integer :recruit_application_id
      t.text :question
      t.text :answer

      t.timestamps null: false
    end
  end
end

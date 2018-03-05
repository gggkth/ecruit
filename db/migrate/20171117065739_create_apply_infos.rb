class CreateApplyInfos < ActiveRecord::Migration
  def change
    create_table :apply_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recruit_post, index: true, foreign_key: true
      t.references :recruit_application, index: true, foreign_key: true
      t.string :status, default: "진행중"
      t.integer :application_eval_score, default: 0
      t.integer :interview_eval_score, default: 0
      t.string :apply_result, default: "미정"

      t.timestamps null: false
    end
  end
end

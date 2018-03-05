class ApplyInfo < ActiveRecord::Base
  add_foreign_key :apply_infos, :recruit_applications 
  belongs_to :user
  belongs_to :recruit_post
  belongs_to :recruit_application
  
end

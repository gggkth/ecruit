class ApplyInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :recruit_post
  belongs_to :recruit_application
  
end

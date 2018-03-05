class RecruitApplication < ActiveRecord::Base
    has_one :user, :through => :apply_info
    has_many :apply_infos
    belongs_to :recruit_post
    has_many :qas
end

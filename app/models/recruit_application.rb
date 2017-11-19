class RecruitApplication < ActiveRecord::Base
    has_many :users, :through => :apply_infos
    has_many :apply_infos
end

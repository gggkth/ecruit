class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :apply_infos
  has_many :recruit_posts, :through => :apply_infos
  has_one :recruit_application, :through => :apply_info
end
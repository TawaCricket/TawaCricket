class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable;

  has_many :juniors, :class_name => 'Junior', :foreign_key => :member_id
  has_one :senior, :class_name => 'Senior', :foreign_key => :member_id

  has_many :comments

  accepts_nested_attributes_for :juniors, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :senior, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :comments, allow_destroy: true, :reject_if => :all_blank
  
end

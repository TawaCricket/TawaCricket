class Junior < ActiveRecord::Base
	belongs_to :member
	has_one :school
end

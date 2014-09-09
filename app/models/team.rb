class Team < ActiveRecord::Base
	has_many :juniors, :class_name => 'Team', :foreign_key => :team_id
	has_many :seniors, :class_name => 'Team', :foreign_key => :team_id
end

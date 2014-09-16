module AdminHelper

	def get_friends(player, all_players)
		friends_mappings = @friends.find(:junior_id => players.id)
		friends = players.find(:junior_id => friends_mapping.friend_id)
		friends
	end

	def find_most_common_school(players)
		#don't know if this will work
		common = players.all(
  			:group  => "school",
  			:select => "school, COUNT(school) as count"
		).order(:count).limit(1)

		common.school
	end

	def get_players_by_school(school, players)
		players.where(:school => school)
	end

	def populate_teams_helper

		#for each year

		girls = @juniors.where(:girls_only => true)
		girls_only_teams = @teams.where(:girls_only => true)
		girls_only_volunteers = @volunteers.find(:member_id => girls.member_id)

		girls_only_teams.each do |team|

			volunteer1 = girls_only_volunteers.pop
			volunteer2 = girls_only_volunteers.pop

			volunteer1.team_id = team.id
			volunteer2.team_id = team.id

			size = 0

			children1 = girls.find(:member_id => volunteer1.member_id)
			children2 = girls.find(:member_id => volunteer2.member_id)

			children = children1 + children2

			size = children.count

			if !children.nil?
				children.each do |child|
					child.team_id = team.id
				end
				children.each(&:save)
			end

			girls = girls - children

		end


		#for each year
			#for each team in that year that isn't girls only
				#for each volunteer not in a team
					#add volunteer/s to team
					#add their children to the same team
					#for each junior in that year 
						#if they're friends add to team
					#for each junior in that year 
						# if they're in the same school add them to the same team
				#fill remaining spaces randomly (as they don't have any friends or school mates).
			
			#for each senior team
				#assign randomly at this stage...

		#if there are additional players left need to decide if we create a team for them
		#or of we just leave them un-assigned

	end

end

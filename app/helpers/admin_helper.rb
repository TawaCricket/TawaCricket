module AdminHelper

  def populate_teams_helper()

    #for each year

    [1, 2, 3, 4, 5, 6, 7].each do |year|

      juniors = @juniors.where(:girls_only => false)
      juniors = juniors.where(:current_school_year => year)

      teams = @teams.where(:female_only => false)
      teams = teams.where(:age_group => year)

      volunteers = @volunteers.where(:junior_id => juniors.all { |x| x.id })

      volunteers.each do |un|
        un.team_id = -2
        un.save
      end

      #if total number of teams * max size is less then players create additional teams.
      if (teams.length * 12 < juniors.length)
        difference = juniors.length - teams.length * 12
        difference = difference / 12
        count = 0;

        while count < difference

          team = Team.new
          team.age_group = year
          team.female_only = false
          team.name = "something"

          team.save

          teams.put(team)

        end

      end

      teams.each do |team|

        if juniors.empty?
          break
        end

        team_members = []
        team_volunteers = []
        team_size = 0

        if !volunteers.empty?

          team_size = 1

          team_volunteers.push(volunteers.pop())
          team_volunteers.push(volunteers.pop())

          #we can assume that if they're volunteering they have a child that we can assign.
          #if they're already in a team we just remove them, it's more important that they go with their family member anyway.

          team_members.push(juniors.where(:id => team_volunteers[0].junior_id).first)
          if volunteers.length > 1
            team_size += 1
            team_members.push(juniors.where(:id => team_volunteers[1].junior_id).first)
          end

          school_mates = []

          team_members.each do |m|
            school_mates = school_mates + juniors.where(:school => m.school)
          end

          count = 0
          #try to fill the team with school_mates
          while count < school_mates.length && team_size < 12

            team_members.push(school_mates.pop())
            team_size += 1
            count += 1

          end
          count = 0
          #if not full add random players
          if team_size < 12
            while count < juniors.length && team_size < 12
              team_members.push(juniors.pop())
              team_size += 1
              count += 1
            end
          end

          team_members.each do |m|
            m.team_id = team.id
            m.save
          end

          team_volunteers.each do |v|
            v.team_id = team.id
            v.save
          end

          volunteers = volunteers - team_volunteers
          juniors = juniors - team_members

        end
      end
    end
  end
end

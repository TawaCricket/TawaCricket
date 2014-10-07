class AdminController < ApplicationController
  include AdminHelper
	def index
		@teams = Team.all
    @juniors = Junior.all
    @volunteers = Volunteer.all
  end

  def not_paid
  	@juniors = Junior.all
  	@seniors = Senior.all
  end

  def generate
    @season = Season.last
    @teams = Team.where(season_id: @season.id)
    @juniors = Junior.where(season_id: @season.id)
    @volunteers = Volunteer.where(season_id: @season.id)
    populate_teams_helper

    respond_to do |format|
      format.html { redirect_to root, notice: 'Succesfully saved changes.' }
      format.json { head :no_content }
    end

  end

	def populate_teams
		@teams = Team.all
		@juniors = Juniors.all
		@senior = Senior.all
		@volunteers = Member.where(:volunteer => true)

		#assign all availible volunteers to respective teams
		#assign children of volunteers to there parents team
		#prioritse children into teams based on their friends and school
		#edge case for girl only teams need to look out for that...

		
	end

	def filter

    @season = Season.last
    @juniors = Junior.where(:season_id => @season.id)
    @teams = Team.where(:season_id => @season.id)
		if !params[:year].blank?
			@juniors = @juniors.where("current_school_year = ?", params[:year])
      @teams = @teams.where("age_group = ?", params[:year])
		end 
		if !params[:school].blank?
			@juniors = @juniors.where(:school => params[:school])
		end 
		if !params[:fmale_only].blank?
			@juniors = @juniors.where(:gender => params[:fmale_only])
      @teams = @teams.where(:female_only => params[:fmale_only])
			#we only want teams where all the members are female.
		end 

		if !params[:senior].blank?
			@seniors = Senior.all
			@juniors = nil
			if !params[:position].blank?
				@senior = @senior.where(:position => params[:position])
			end 
		end 

		@volunteers = Volunteer.where(:season_id => @season.id)

		respond_to do |format|
    	    format.html { render :partial => 'teams', :layout => false }
    	    format.json { head :no_content }
      	end
	end

	def save
		@players = params[:players]
		@players.each do |player|
			@some = Junior.find(player[1][:player])
			@some.team_id = player[1][:team]
			@some.save
		end
		
		respond_to do |format|
    	    format.html { redirect_to root, notice: 'Succesfully saved changes.' }
        	format.json { head :no_content }
      	end
	end

end

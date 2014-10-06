class TeamsController < ApplicationController
  def new
  	@team = Team.new
  end
def show
  @season = Season.last
  @teams = Team.where(season_id: @season.id)
end

  def get_all_teams
    @season = Season.last
    @teams = Team.where(season_id: @season.id)
    render :partial => 'team_table', :layout => false
  end

  def new_form
    @team = Team.new
    render :partial => 'form', :layout => false
  end
def create
	  @team = Team.new(team_params)
    @season = Season.last
    @team.season_id = @season.id

 	  respond_to do |format|
      	if @team.save
        	format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        	format.json { head :no_content }
      	else
        	format.html { render action: 'edit' }
        	format.json { render json: @team.errors, status: :unprocessable_entity }
      	end
      end
	end

  def team_params
		params.require(:team).permit(:name, :female_only, :age_group)
  end

  def edit
  end
end

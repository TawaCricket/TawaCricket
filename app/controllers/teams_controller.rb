class TeamsController < ApplicationController
  def new
  	@team = Team.new
  end
def show
  @team = Team.all
  end
def create
	  @team = Team.new(team_params)
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
		params.require(:team).permit(:name)
    end

  def edit
  end
end

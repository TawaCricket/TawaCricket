class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
  end

  def new_form
    @volunteer = Volunteer.new
    render :partial => 'form', :layout => false
  end

  def create
    print "Made it here \n\n\n\n\n\n"
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.member_id = current_member.id
    @volunteer.junior_id = params[:junior_id]
    @season = Season.last
    @volunteer.season_id = @season.id

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end

  end

  def volunteer_params
    params.require(:volunteer).permit(:name, :contact, :description, :email)
  end

end

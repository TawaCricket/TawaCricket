class SeniorController < ApplicationController
	def index
		@seniors = Senior.All
	end

	def new
		@senior = Senior.All
	end

	def new_form
		@senior = Senior.new
  		render :partial => 'form', :layout => false
	end

	def create
	  @senior = Senior.new(senior_params)
	  @senior.member_id = current_member.id
 	  respond_to do |format|
      	if @senior.save
        	format.html { redirect_to @senior, notice: 'Senior was successfully updated.' }
        	format.json { head :no_content }
      	else
        	format.html { render action: 'edit' }
        	format.json { render json: @senior.errors, status: :unprocessable_entity }
      	end
      	end
	end

	def senior_params
		params.require(:senior).permit(:position, :grade)
    end
    
end

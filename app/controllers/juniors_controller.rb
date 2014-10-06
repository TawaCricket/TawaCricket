class JuniorsController < ApplicationController
	def index
    @season = Season.last
		@juniors = Junior.where(:season_id => @season.id)
	end

	def show

	end

	def create
    @senior = Senior.last

	  @junior = Junior.new(junior_params)
	  @junior.member_id = current_member.id
    @junior.season_id = @senior.id

 	  respond_to do |format|
      	if @junior.save
        	format.html { redirect_to @junior, notice: 'Junior was successfully updated.' }
        	format.json { head :no_content }
      	else
        	format.html { render action: 'edit' }
        	format.json { render json: @junior.errors, status: :unprocessable_entity }
      	end
      end
  end

	def update
		@junior = Junior.where(:id => params[:junior_id]).first

 	  respond_to do |format|
      	if @junior.update(junior_params)
        	format.html { redirect_to @junior, notice: 'Junior was successfully updated.' }
        	format.json { head :no_content }
      	else
        	format.html { render action: 'edit' }
        	format.json { render json: @junior.errors, status: :unprocessable_entity }
      	end
      end
	end


	def new
		@junior = Junior.new
	end

	def new_form
		@junior = Junior.new
  		render :partial => 'form', :layout => false
	end

	def update_form
		@junior = Junior.where(:id => params[:junior_id]).first
		render :partial => 'form', :layout => false
	end

	def get_juniors
		@juniors = Junior.where(:team_id => params[:team_id])
		render :partial => 'junior_table', :layout => false
	end

	def get_all_juniors
    @season = Season.last
		@juniors = Junior.where(:season_id => @season.id)
		render :partial => 'junior_table', :layout => false
	end

	def destroy
		#@junior.destroy
		respond_to do |format|
      		format.html { redirect_to root }
      		format.json { head :no_content }
    	end
	end

  	def junior_params
		  params.require(:junior).permit(:first_name, :last_name, :address, :email, :gender, :school, :dob, :grade_last_season, :current_school_year, :girls_only)
    end
end

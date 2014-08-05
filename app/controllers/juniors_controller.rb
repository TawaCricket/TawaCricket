class JuniorsController < ApplicationController
	def index 
		@juniors = Junior.all
	end

	def create
	  @junior = Junior.new(junior_params)
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

	def new
		@junior = Junior.new
	end

  	def junior_params
		params.require(:junior).permit(:first_name, :last_name, :address, :email, :age)
    end
end

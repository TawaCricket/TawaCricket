class JuniorsController < ApplicationController
	def index 
		@juniors = Junior.all
	end

	def show

	end

	def create
	  @junior = Junior.new(junior_params)
	  @junior.member_id = current_member.id
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

	def new_form
		@junior = Junior.where(:member_id => current_member.id).first
		if @junior.nil?
			@junior = Junior.new
		end
  		render :partial => 'form', :layout => false
	end

	def destroy
		#@junior.destroy

		respond_to do |format|
      		format.html { redirect_to root }
      		format.json { head :no_content }
    	end
	end

  	def junior_params
		params.require(:junior).permit(:first_name, :last_name, :address, :email, :age)
    end
end

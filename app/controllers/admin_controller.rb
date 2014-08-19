class AdminController < ApplicationController
	def index
		@volunteers = Member.where(:volunteer => true)
		@juniors = Junior.all
		@seniors = Senior.all
		@teams = Team.all
	end

	def save
		
		respond_to do |format|
    	    format.html { redirect_to root, notice: 'Succesfully saved changes.' }
        	format.json { head :no_content }
      	end
	end

end

class AdminController < ApplicationController
	def index

	end

	def filter
		@volunteers = Member.where(:volunteer => true)
		@juniors = Junior.all
		@seniors = Senior.all
		@teams = Team.all

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

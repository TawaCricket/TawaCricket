class AdminController < ApplicationController
	def index
		@volunteers = Member.where(:volunteer => true)
		@juniors = Junior.all
		@seniors = Senior.all
		@teams = Team.all
		print "\n"
		print @teams
		print "\n"
	end

	def save
		@players = params[:players]
		@players.each do |player|
			print "\n"
			print player
			print "\n"
			print player[1]
			print "\n"
			print player[1][:player]
			print "\n"
			print player[1][:team]
			print "\n"
			@some = Junior.find(player[1][:player])
			@some.team_id = player[1][:team]
			@some.save
			print "\n"
		end
		
		respond_to do |format|
    	    format.html { redirect_to root, notice: 'Succesfully saved changes.' }
        	format.json { head :no_content }
      	end
	end

end

class AdminController < ApplicationController
	def index
		@volunteers = Member.where(:volunteer => true)
		@juniors = Junior.all
		@seniors = Senior.all
		@teams = Team.all
	end

	def save

	end
end

class UsermanagementController < ApplicationController
	def index
		@usermanagements = Member.find(:all)
	end


end

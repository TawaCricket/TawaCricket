class SeniorController < ApplicationController
	def index
		@seniors = Senior.All
	end

	def new
		@senior = Senior.All
	end
end

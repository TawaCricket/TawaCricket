class JuniorController < ApplicationController
	def index 
		@juniors = Junior.all
	end

	def new
		@junior = Junior.new
	end
end

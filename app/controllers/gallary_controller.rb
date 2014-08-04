class GallaryController < ApplicationController
	def index
	end
	def show
		#@image = Image.create(params[:image])
	end
	def create
  @image = Image.new
	end
end

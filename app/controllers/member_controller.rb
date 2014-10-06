class MemberController < ApplicationController
	before_action :authenticate_member!, only: :token

	def index
		@member = current_member
		@images = Image.all
	end
	def show
		@member = current_member
	end

end

class MemberController < ApplicationController
	before_action :authenticate_member!, only: :token

	def index
		@member = current_member
	end
end

class MemberController < ApplicationController
	before_action :authenticate_member!, only: :token

	def index
	end
	
end

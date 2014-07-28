class MemberController < ApplicationController
	before_action :authenticate_member!, only: :token
	def token
	end
end

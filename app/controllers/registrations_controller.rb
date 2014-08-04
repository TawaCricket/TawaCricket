class RegistrationsController < Devise::RegistrationsController
  	before_filter :authenticate_member!, :only => :token

  	def new
    	super
    end

  	def create
  		super
  	end

  	def edit
  		super
  	end

	def update
		@member.update(member_params)

		@member.juniors.each do |junior|
			#we will want to do some extra validation here
		end

		if !@member.senior.nil?
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
			print "-----------------------------------------------------------------------------------"
		end


		if @member.save
			redirect_to root_path
        else
        	format.html { render action: 'edit' }
        	format.json { render json: @company.errors, status: :unprocessable_entity }
        end
	end

	private 

	def member_params
		params.require(:member).permit(juniors_attributes: [])
	end
end 
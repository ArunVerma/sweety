class GlucoseLevelsController < ApplicationController
	def index
		# get todays glucose level counts for current user  - use a scope
		# @glucose_levels = current_user.glucose_levels
		@daily_glucose_levels = current_user.glucose_levels
	end

	def create
		glucose_level = GlucoseLevel.new(glucose_level_params)
		message = "ERROR : Reding can't be added"
		status = 500
		if glucose_level.save
			message =  "Reding added successfully"
			status = 200
		end
		render json: { message: message, status: status }
	end

	private
	def glucose_level_params
		params.require(:glucose_level).permit(:reading, :user_id)
	end
end

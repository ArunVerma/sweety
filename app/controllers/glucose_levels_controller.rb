class GlucoseLevelsController < ApplicationController
	def index
		@glucose_levels = current_user.glucose_levels.select(:reading, :created_at).where('date(created_at) = ?', Date.today)
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

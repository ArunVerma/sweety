class GlucoseLevelsController < ApplicationController
	def index
	end

	def create
	end

	private
	def glucose_level_params
		params.require(:glucose_level).permit(:reading, :user_id)
	end
end

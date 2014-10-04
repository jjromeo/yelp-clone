class EndorsementsController < ApplicationController

	def create
		@reviews = Review.find(params[:review_id])
		@reviews.endorsements.create
		render json: {new_endorsement_count: "#{@reviews.endorsements.count} endorsements"}
	end

	# def index
	# 	create
	# end


end

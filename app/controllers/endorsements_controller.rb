class EndorsementsController < ApplicationController

	include ActionView::Helpers::TextHelper

	def create
		@reviews = Review.find(params[:review_id])
		@reviews.endorsements.create
		render json: {new_endorsement_count: "#{pluralize(@reviews.endorsements.count, "endorsement")}"}
	end

	# def index
	# 	create
	# end


end

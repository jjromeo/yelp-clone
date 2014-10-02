class EndorsementsController < ApplicationController

def create
	@reviews = Review.find(params[:review_id])
	@reviews.endorsements.create
	redirect_to restaurants_path
end

end

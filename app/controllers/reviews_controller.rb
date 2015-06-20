class ReviewsController < ApplicationController
	def new
	end

	def create
	  #raise params.inspect
	  @server = Server.find(params[:server_id])
	  @review = Review.new(review_params.merge({user_id: 79}))
	  @vote   = Vote.new(votes_params.merge({user_id: 79}))
	  @review.server = @vote.server = @server

	  if @vote.valid? && @review.valid?
	    @vote.save
	    @review.save
	  else
	  	flash[:errors] = @review.errors.full_messages + @vote.errors.full_messages
	    render "servers/show"
	  end
	end

	private
	  def review_params
	  	params.require(:review).permit(:positive, :negative, :comment)
	  end

	  def votes_params
	  	params.require(:vote).permit(:rating)
	  end
end

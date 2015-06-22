class ReviewsController < ApplicationController
	before_action :authenticate_user!, :only => :create

	def create
	  @server = Server.find(params[:server_id])
	  @review = Review.new(review_params.merge({user_id: current_user.id}))
	  @vote   = Vote.new(votes_params.merge({user_id: current_user.id}))
	  @review.server = @vote.server = @server

	  if @vote.valid? && @review.valid?
	    save_models [@vote, @review]
	  else
	  	flash.now[:errors] = @review.errors.full_messages + @vote.errors.full_messages
	  end
	  render "servers/show"
	end

	private
	  def review_params
	  	params.require(:review).permit(:positive, :negative, :comment)
	  end

	  def votes_params
	  	params.require(:vote).permit(:rating)
	  end

	  def save_models(models)
	  	models.each do |m|
	  	  m.save
	  	end
	  end
end

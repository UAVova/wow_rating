class VotesController < ApplicationController

	def create
      @server = Server.find(params[:server_id])
      @vote   = Vote.new(votes_params.merge({user_id: current_user.id}))
      @vote.server = @server
      if @vote.save
      	redirect_to @server, notice: "Vote successfully submited!"
      else
      	redirect_to @server, alert:  "Something went wrong!"
      end
	end

	private

	  def votes_params
	  	params.require(:vote).permit(:rating, :username)
	  end
end
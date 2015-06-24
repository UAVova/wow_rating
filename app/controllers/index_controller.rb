class IndexController < ApplicationController
  def index
  	@servers = Server.all.order("votes_count DESC")
  end
end

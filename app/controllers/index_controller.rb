class IndexController < ApplicationController
  def index
  	@servers = Server.order("rating DESC")
  end
end

class ServersController < ApplicationController
  def new
  	@servers = Server.new
  end
end

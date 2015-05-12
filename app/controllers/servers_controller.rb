class ServersController < ApplicationController

  def new
  	@server = Server.new
  end

  def create
  	@server = Server.new(server_params)
  	if @server.save
  		redirect_to root_path
  	else
  		redirect_to server_creation_path
  	end
  end

  private

  def server_params
      params.require(:server).permit(:title, :description, :url, :image,
                                     realms_attributes: [:name,  :description,
                                     					 :rates, :online])
  end
end

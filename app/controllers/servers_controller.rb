class ServersController < ApplicationController
  before_filter :authenticate_user!

  def new
  	@server = Server.new
  	models_data
  end

  def create
  	@server = Server.new(server_params)
    @server.owner = current_user.id
    #raise server_params.inspect
  	if @server.save
  		redirect_to root_path
  	else
      @server_types = RealmType.all()
      models_data
  		render "new"
  	end
  end

  private

  def models_data
    @server_types = RealmType.all()
    @patches = WowPatch.all()
  end

  def server_params
      params.require(:server).permit(:title, :description, :url, :image, :owner,
                                     realms_attributes: [:name,  :description, :creation_date,
                                     					           :rates, :version,     :online,
                                                         :realm_type_id])
  end
end

class ServersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
  	@server = Server.new
  	models_data
  end

  def show
    @server = Server.find(params[:id])
  end

  def create
  	@server = Server.new(server_params)
    @server.owner = current_user.id
  	if @server.save
  		redirect_to root_path
  	else
      @server_types = RealmType.all()
      models_data
  		render "new"
  	end
  end

  def add_review
    @user = User.find(79)
    if Server.exists?(:id => params[:id])
      if @user.update(review_params[:server])
        raise "OK"
      else
        raise @user.errors.full_messages.inspect
      end
    end
  end

  private

  def review_params
    params.require(:server).permit(:id, reviews_attributes: [:positive,  :negative, :comment],
                                        votes_attributes: [ :rating ])
  end

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

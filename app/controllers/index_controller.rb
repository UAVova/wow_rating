class IndexController < ApplicationController
  def index
  	@servers = Server.all.sort { |a, b| b.votes.count <=> a.votes.count   }
  end
end

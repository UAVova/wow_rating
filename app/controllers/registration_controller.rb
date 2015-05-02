class RegistrationController < ApplicationController
  def new
  	@User = User.new
  end
end

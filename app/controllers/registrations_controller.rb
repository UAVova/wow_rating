class RegistrationsController < Devise::RegistrationsController
  before_action :check_action, only: :new

  # If user wants to sign up using site registration, we need to delete all social data first (if it's exists)
  def check_action
    if params["reg_action"] && params["reg_action"] == "site" && session["devise.user_attributes"]
  		session.delete("devise.user_attributes")
  	end
  end

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  def edit
    super
  end
end 
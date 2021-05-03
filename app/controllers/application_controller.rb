class ApplicationController < ActionController::Base
  respond_to :json

  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name
    ])    
  end

end

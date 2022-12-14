class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_surgery, :age, :sex, :height, :weight_before_surgery, :target_weight, :vitamin_record, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_surgery, :age, :sex, :height, :weight_before_surgery, :target_weight, :vitamin_record, :avatar])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
  
end

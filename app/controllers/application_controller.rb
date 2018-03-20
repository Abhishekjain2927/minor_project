class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :configure_devise_params,if: :devise_controller?
 
 rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
end

def current_ability
	@current_ability ||= ::Ability.new(current_patient)
	end

	def configure_devise_params
	devise_parameter_sanitizer.permit(:sign_up) do |u|
	u.permit(:age,:gender,:mobile_no,
		:email,:password,:password_confirmation,:doctor,:admin)
		end

  end
end 
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_up_path_for(resource)
        mypage_url(resource)
      end

      def after_sign_in_path_for(resource)
        mypage_url(resource)
      end

      def after_sign_out_path_for(resource)
        new_user_session_path
      end

      private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end

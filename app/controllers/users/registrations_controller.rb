module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    # def sign_up_params
    #   params.require(:user).permit(:email, :password, :password_confirmation, :device_os)
    # end
  end
end

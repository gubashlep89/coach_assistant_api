module Api
  module V1
    class CurrentUserController < ApplicationController
      def show
        @user = current_user
      end
    end
  end
end

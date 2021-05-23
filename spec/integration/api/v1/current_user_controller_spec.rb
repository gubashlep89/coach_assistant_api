require 'swagger_helper'

describe 'Current User info' do
  path '/current_user' do
    get 'Info about authenticated user' do
      tags 'CurrentUser'

      response '200', 'info about user' do
        schema Structures::User.show_form
        let(:user) { FactoryBot.create(:user) }
        before do
          sign_in(user)
        end

        run_test!
      end

      response '401', 'user is not authenticated' do
        run_test!
      end
    end
  end
end

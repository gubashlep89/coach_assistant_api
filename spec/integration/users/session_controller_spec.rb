require 'swagger_helper'

describe 'User sessions API' do
  before do
    @user = FactoryBot.create(:user)
  end

  path '/auth/sign_in' do
    post 'Authenticate user by email and password' do
      tags 'UserSessions'

      parameter name: :user, in: :body, required: true,
                schema: Structures::User.devise_responce_form

      response '201', 'user authenticated' do
        schema Structures::User.show_form
        let(:user) { { user: { email: @user.email, password: @user.password } } }
        run_test!
      end

      response '401', 'wrong credentials' do
        let(:user) { { user: { email: @user.email, password: '1' } } }
        run_test!
      end
    end
  end

  path '/auth/sign_out' do
    delete 'Delete user session' do
      tags 'UserSessions'

      response '204', 'user session deleted' do
        before do
          sign_in(@user)
        end

        run_test!
      end
    end
  end
end

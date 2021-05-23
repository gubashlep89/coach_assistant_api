require 'swagger_helper'

describe 'User registration API' do
  path '/auth' do
    post 'Create user' do
      tags 'UserRegistration'

      parameter name: :user, in: :body, required: true,
                schema: Structures::User.devise_responce_form
      response '201', 'user authenticated' do
        let(:user) { { user: { email: Faker::Internet.email, password: 'Password!' } } }

        run_test!
      end
    end
  end
end

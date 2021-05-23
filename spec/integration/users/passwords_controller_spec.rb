require 'swagger_helper'

describe 'User passwords API' do
  path '/auth/password' do
    post 'Create link to generate new password' do
      tags 'UserPassword'

      parameter name: :user, in: :body, required: true,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        email: { type: :string }
                      }
                    }
                  }
                }
      response '201', 'ok' do
        let(:email) { FactoryBot.create(:user).email }
        let(:user) { { user: { email: email } } }
        run_test!
      end
    end

    put 'Update password' do
      tags 'UserPassword'

      parameter name: :payload, in: :body, required: true,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        reset_password_token: { type: :string },
                        password: { type: :string },
                        password_confirmation: { type: :string }
                      }
                    }
                  }
                }
      response '204', 'ok' do
        let(:user) { FactoryBot.create(:user) }
        let(:payload) { { user: { reset_password_token: user.send_reset_password_instructions, password: 'Password!' } } }

        run_test!
      end
    end
  end
end

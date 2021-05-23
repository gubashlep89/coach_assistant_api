module Structures
  module User
    class << self
      def show_form
        all_fields_required(
          all_fields_required(
            {
              type: :object,
              properties:
                {
                  id: { type: :integer },
                  email: { type: :string },
                  created_at: { type: :string, format: :datetime },
                  updated_at: { type: :string, format: :datetime }
                }
            }
          )
        )
      end

      def devise_responce_form
        all_fields_required(
          all_fields_required(
            {
              type: :object,
              properties: {
                user: {
                  type: :object,
                  properties: {
                    email: { type: :string },
                    password: { type: :string }
                  }
                }
              }
            }
          )
        )
      end
    end
  end
end

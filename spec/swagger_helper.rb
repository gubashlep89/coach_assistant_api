# frozen_string_literal: true

require 'rails_helper'
require_relative 'support/structures'
require_relative 'support/helpers'

RSpec.configure do |config|
  config.include Helpers
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      basePath: '/api/v1',
      consumes: ['application/json'],
      produces: ['application/json']
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
end

def all_fields_required(structure)
  structure[:required] = structure[:properties].map { |k, _v| k.to_s }
  structure[:additionalProperties] = false
  structure[:properties].each do |_k, v|
    all_fields_required(v) if v[:type] == :object && v[:properties].present? && !v[:schema_change_allowed]
  end
  structure
end

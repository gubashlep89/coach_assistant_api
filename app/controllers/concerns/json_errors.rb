module JsonErrors
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |error|
      Rails.logger.error error
      # puts error.backtrace if Rails.env.development?
      Rails.logger.error error.backtrace
      render_500(error)
    end
    rescue_from ActiveRecord::RecordNotFound do |error|
      Rails.logger.error error
      render_404('resource not found')
    end
    rescue_from ActionController::ParameterMissing, with: :render_400

    def render_400(errors = 'required parameters invalid')
      render_errors(errors, :bad_request)
    end

    def render_401(errors = 'unauthorized access')
      render_errors(errors, :unauthorized)
    end

    def render_404(errors = 'not found')
      render_errors(errors, :not_found)
    end

    def render_422(errors = 'could not save data')
      render_errors(errors, :unprocessable_entity)
    end

    def render_500(errors = 'internal server error')
      render_errors(errors, :internal_server_error)
    end

    def render_errors(errors, status = :bad_request)
      data = { status: 'failed', errors: Array.wrap(errors), result: [] }

      logger.error errors

      render json: data, status: status
    end

    def render_object_errors(obj, status = :bad_request)
      case obj.class
      when ActiveRecord::Base
        render_object_errors(obj.errors, status)
      when ActiveModel::Errors
        render_errors(obj.detail_codes.map { |c| { code: c, message: c.humanize } }, status)
      else
        render_errors(obj, status)
      end
    end
  end
end

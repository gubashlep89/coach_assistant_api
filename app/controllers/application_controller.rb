class ApplicationController < ActionController::API
  include JsonErrors
  include Devise::Controllers::Helpers
  include ActionView::Layouts
  include ActionController::Cookies
  include ActionController::MimeResponds
  include ActionController::Caching
  include ActionView::Rendering

  before_action :authenticate_user!
end

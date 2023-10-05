class ApplicationController < ActionController::Base
  after_action :track_action

  def default_translation
    "nasb"
  end
  helper_method :default_translation

  private

  def track_action
    ahoy.track "#{request.raw_request_method} #{params[:controller]}##{params[:action]}", request.path_parameters
  end
end

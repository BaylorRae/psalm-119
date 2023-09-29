class ApplicationController < ActionController::Base
  def default_translation
    "nasb"
  end
  helper_method :default_translation
end

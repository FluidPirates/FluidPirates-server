class ApplicationController < ActionController::Base
  def current_user
    # No authentication for our static frontend
  end
end

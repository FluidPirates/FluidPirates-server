class API::APIController < ApplicationController
	before_action :set_content_type_json

  protected

  def render_error(message, status: :bad_request)
    render json: { message: message }, status: status
  end

  def render_success(message = 'Success', status: :ok)
    render json: { message: message }, status: status
  end

  def set_content_type_json
    headers['Content-Type'] = 'application/json'
  end
end


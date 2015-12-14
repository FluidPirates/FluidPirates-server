class API::APIController < ApplicationController
  before_action :verify_token
	before_action :set_content_type_json

  protected

  def render_error(message, status: :bad_request)
    render json: { message: message }, status: status
  end

  def render_success(message = 'Success', status: :ok)
    render json: { message: message }, status: status
  end

  def current_token
    return unless params[:token].present?
    Token.find_by(value: params[:token])
  end

  def current_user
    current_token.try(:user)
  end

  def verify_token
    if !current_token || current_token.expired?
      render_error("Token missing")
    end
  end

  def set_content_type_json
    headers['Content-Type'] = 'application/json'
  end
end


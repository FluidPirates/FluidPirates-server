class API::APIController < ApplicationController
  before_action :verify_token
	before_action :set_content_type_json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def render_error(message, status: :bad_request)
    render_message(message, status: status)
  end

  def render_success(message = 'Success', status: :ok)
    render_message(message, status: status)
  end

  def record_not_found(exception)
    render_message("Record not found", status: :not_found, extras: { details: exception.message })
  end

  def render_message(message, status:, extras: {})
    if Rails.env.development?
      render json: { message: message, status: status }.merge(extras), status: status
    else
      render json: { message: message }.merge(extras), status: status
    end
  end

  def current_token
    return unless params[:token].present?
    @current_token ||= Token.find_by(value: params[:token])
  end

  def current_user
    current_token.user
  end

  def verify_token
    if !current_token
      render_error("Token missing")
    elsif current_token.expired?
      render_error("Token expired")
    elsif !current_token.user
      render_error("Token doesn't belong to an user")
    end
  end

  def set_content_type_json
    headers['Content-Type'] = 'application/json'
  end
end


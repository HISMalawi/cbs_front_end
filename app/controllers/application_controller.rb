class ApplicationController < ActionController::Base

  before_action :check_auth_token, :except => %w(sign_in sign_up)
  protect_from_forgery with: :exception

  def post_params(url,payload,authorization=nil,method='post')
    response = RestClient::Request.execute(
        method: method,
        url: url,
        headers: {
            ContentType: 'json',
            Authorization: authorization
        },
        content_type: "application/json",
        payload: payload
    )

    return response
  end

  def get_params(url,params)

  end

  private
  def check_auth_token
    if session[:authentication_token].blank?
      redirect_to '/sign_in'
    end
  end
end

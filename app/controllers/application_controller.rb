class ApplicationController < ActionController::Base
  require 'yaml'

  before_action :check_auth_token, :except => %w(sign_in sign_up)
  protect_from_forgery with: :exception

  IDS_SETTINGS = YAML.load_file("#{Rails.root}/config/application.yml")['ids_api']
  IDS_PROTOCOL = IDS_SETTINGS['protocol']
  IDS_URL = IDS_SETTINGS['url']

  def post_params(url,payload,method='post')
    response = RestClient::Request.execute(
        method: method,
        url: IDS_PROTOCOL + '://' + IDS_URL + url,
        headers: {
            ContentType: 'json',
            Authorization: session[:authentication_token]
        },
        content_type: "application/json",
        payload: payload
    )
    
    return response
  end

  def format_passed_date(date_value)
    start_param = date_value.split('/')
    day = start_param[1]
    month = start_param[0]
    year = start_param[2]

    "#{day}/#{month}/#{year}"
  end

  private
  def check_auth_token
    if session[:authentication_token].blank?
      redirect_to '/sign_in'
    end
  end
end

class UsersController < ApplicationController
  def index
  end

  def new
    if request.post?
      payload = {
          name: params['name'],
          username: params['username'],
          email: params['email'],
          password: params['password'],
          password_confirmation: params['password_confirmation']
      }

      url = '/users/create'

      post_params(url,payload)

    else
      render layout: 'octopus'
    end
  end

  def show
    render layout: 'octopus'
  end

  def sign_in
    if request.post?
      payload = {
          username: params['username'],
          password: params['password']
      }

      url = '/authenticate'

      response = post_params(url,payload)

      response = JSON.parse(response)

      if response.include? 'auth_token'
        session[:username] = response['username']
        session[:authentication_token] = response['auth_token']
        render json: { token: session[:authentication_token]}
      end
    else
      render layout: 'sign_on'
    end
  end

  def sign_up
    render layout: 'sign_on'
  end

  def password_recovery
    render layout: 'sign_on'
  end

  def sign_out
    session.clear
    redirect_to '/sign_in'
  end
end

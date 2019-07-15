class UsersController < ApplicationController
  def index
  end

  def new
    render layout: 'octopus'
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

      response = post_params('http://localhost:3001/authenticate',payload)

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

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
    render layout: 'sign_on'
  end

  def sign_up
    render layout: 'sign_on'
  end

  def password_recovery
    render layout: 'sign_on'
  end

  def sign_out

  end
end

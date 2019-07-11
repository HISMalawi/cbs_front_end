class UsersController < ApplicationController
  def index
  end

  def new
    render layout: 'octopus'
  end

  def show
    render layout: 'octopus'
  end
end

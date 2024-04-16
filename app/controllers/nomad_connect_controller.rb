class NomadConnectController < ApplicationController
  before_action :authenticate_user!
  def index
    # This action renders the index view
  end

  def create
    # Your logic for creating a group
  end

  def join
    # Your logic for joining a group
  end

  def view
    # Your logic for viewing a group
  end
end

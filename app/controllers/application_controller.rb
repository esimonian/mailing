class ApplicationController < ActionController::Base
  layout "show", only: [:show]
  
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def index
  end
end

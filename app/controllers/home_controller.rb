class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
   @name = current_user.name
  end

end
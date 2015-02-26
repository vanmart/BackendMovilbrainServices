class HomeController < ApplicationController
  
  before_action :authenticate_user!

  def index
  	#@things = current_user.things
  	@users = User.all
  end
end
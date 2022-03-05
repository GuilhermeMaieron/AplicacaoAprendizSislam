class WelcomeController < ApplicationController

  skip_before_action :verificaruser
  def index
  end
end

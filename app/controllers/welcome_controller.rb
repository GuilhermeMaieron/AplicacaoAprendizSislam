class WelcomeController < ApplicationController

  skip_before_action :verificarlogin
  def index
  end
end

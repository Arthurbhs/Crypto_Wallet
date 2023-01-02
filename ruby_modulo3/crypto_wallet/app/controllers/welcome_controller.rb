class WelcomeController < ApplicationController
  def index
    @nome = params[:name]
  end
end

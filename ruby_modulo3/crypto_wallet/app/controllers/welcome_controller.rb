class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails (isto e um bicoito)"
    session[:curso] = "Curso de Ruby on Rails (isto e uma sessão)"
    @nome = params[:name]
  end
end

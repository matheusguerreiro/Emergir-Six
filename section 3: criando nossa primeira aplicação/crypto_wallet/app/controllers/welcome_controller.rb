class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails" # pode ser usado com session em vez de cookie
    @nome = params[:nome]
  end
end

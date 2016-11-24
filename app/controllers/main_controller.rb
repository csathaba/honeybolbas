class MainController < ApplicationController

  def index
    @honeys = Honey.all
  end

end

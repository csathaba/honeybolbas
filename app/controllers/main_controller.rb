class MainController < ApplicationController

  def index
    @honeys =  Honey.all.order(:rank)
    @honeys_portrait =  Honey.all.where(orientation_landscape: false).order(:rank)
    @honeys_landscape = Honey.all.where(orientation_landscape: true).order(:rank)
    # @next_honey = Honey.next
  end

end

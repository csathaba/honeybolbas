class MainController < ApplicationController

  def index
    @honeys =  Honey.all
    @honeys_portrait =  Honey.all.where(orientation_landscape: false)
    @honeys_landscape = Honey.all.where(orientation_landscape: true)
    # @next_honey = Honey.next
  end

end

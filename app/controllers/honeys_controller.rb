class HoneysController < ApplicationController
  before_action :set_honey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /honeys
  # GET /honeys.json
  def index
    @honeys = Honey.all.order(:orientation_landscape, :rank)
  end

  # GET /honeys/1
  # GET /honeys/1.json
  def show
  end

  # GET /honeys/new
  def new
    @honey = Honey.new
  end

  # GET /honeys/1/edit
  def edit
  end

  # POST /honeys
  # POST /honeys.json
  def create
    @honey = Honey.new(honey_params)

    respond_to do |format|
      if @honey.save
        format.html { redirect_to honeys_url, notice: 'Honey was successfully created.' }
        format.json { render :show, status: :created, location: @honey }
      else
        format.html { render :new }
        format.json { render json: @honey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /honeys/1
  # PATCH/PUT /honeys/1.json
  def update
    respond_to do |format|
      if @honey.update(honey_params)
        format.html { redirect_to honeys_url, notice: 'Honey was successfully updated.' }
        format.json { render :show, status: :ok, location: @honey }
      else
        format.html { render :edit }
        format.json { render json: @honey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /honeys/1
  # DELETE /honeys/1.json
  def destroy
    @honey.destroy
    respond_to do |format|
      format.html { redirect_to honeys_url, notice: 'Honey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_ranks
    Honey.first.set_ranks
    redirect_to honeys_url, notice: 'Ranks set successfully.'
  end

  def rank_up
    Honey.find(params[:id]).rank_up
    @honeys = Honey.all.order(:orientation_landscape, :rank)
    respond_to do |format|
      format.html { redirect_to honeys_url }
      format.js {}
    end
  end

  def rank_down
    Honey.find(params[:id]).rank_down
    @honeys = Honey.all.order(:orientation_landscape, :rank)
    respond_to do |format|
      format.html { redirect_to honeys_url }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_honey
      @honey = Honey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def honey_params
      params.require(:honey).permit(:name, :description_hu, :description_en, :description_de, :honeyimg, :orientation_landscape, :rank)
    end
end

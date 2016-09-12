class NflWeathersController < ApplicationController
  before_action :set_nfl_weather, only: [:show, :edit, :update, :destroy]

  # GET /nfl_weathers
  # GET /nfl_weathers.json
  def index
    @q = NflWeather.ransack(params[:q])
    @nfl_weathers =  @q.result.page params[:page]
  end

  # GET /nfl_weathers/1
  # GET /nfl_weathers/1.json
  def show
  end

  # GET /nfl_weathers/new
  def new
    @nfl_weather = NflWeather.new
  end

  # GET /nfl_weathers/1/edit
  def edit
  end

  # POST /nfl_weathers
  # POST /nfl_weathers.json
  def create
    @nfl_weather = NflWeather.new(nfl_weather_params)

    respond_to do |format|
      if @nfl_weather.save
        format.html { redirect_to @nfl_weather, notice: 'Nfl weather was successfully created.' }
        format.json { render :show, status: :created, location: @nfl_weather }
      else
        format.html { render :new }
        format.json { render json: @nfl_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfl_weathers/1
  # PATCH/PUT /nfl_weathers/1.json
  def update
    respond_to do |format|
      if @nfl_weather.update(nfl_weather_params)
        format.html { redirect_to @nfl_weather, notice: 'Nfl weather was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfl_weather }
      else
        format.html { render :edit }
        format.json { render json: @nfl_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    weathers = FFNerd.weather
    weathers.each do |record|
      game_weather = NflWeather.where(game_week: record.game_week, home_team: record.home_team, away_team: record.away_team).first_or_initialize
      incoming_fields = record.to_h.select { |k,v| game_weather.respond_to? k }
      game_weather.update(incoming_fields)
      game_weather.save
    end
    redirect_to nfl_weathers_path
  end

  # DELETE /nfl_weathers/1
  # DELETE /nfl_weathers/1.json
  def destroy
    @nfl_weather.destroy
    respond_to do |format|
      format.html { redirect_to nfl_weathers_url, notice: 'Nfl weather was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfl_weather
      @nfl_weather = NflWeather.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfl_weather_params
      params.require(:nfl_weather).permit(:game_week, :game_date, :home_team, :away_team, :stadium, :is_dome, :geo_lat, :geo_long, :low, :high, :forcast, :wind_chill, :wind_speed, :dome_img, :small_img, :medium_img, :large_img)
    end
end

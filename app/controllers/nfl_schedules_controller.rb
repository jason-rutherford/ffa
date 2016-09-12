class NflSchedulesController < ApplicationController
  before_action :set_nfl_schedule, only: [:show, :edit, :update, :destroy]

  # GET /nfl_schedules
  # GET /nfl_schedules.json
  def index
    @q = NflSchedule.ransack(params[:q])
    @nfl_schedules =  @q.result.page(params[:page])
  end

  # GET /nfl_schedules/1
  # GET /nfl_schedules/1.json
  def show
  end

  # GET /nfl_schedules/new
  def new
    @nfl_schedule = NflSchedule.new
  end

  # GET /nfl_schedules/1/edit
  def edit
  end

  # POST /nfl_schedules
  # POST /nfl_schedules.json
  def create
    @nfl_schedule = NflSchedule.new(nfl_schedule_params)

    respond_to do |format|
      if @nfl_schedule.save
        format.html { redirect_to @nfl_schedule, notice: 'Nfl schedule was successfully created.' }
        format.json { render :show, status: :created, location: @nfl_schedule }
      else
        format.html { render :new }
        format.json { render json: @nfl_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfl_schedules/1
  # PATCH/PUT /nfl_schedules/1.json
  def update
    respond_to do |format|
      if @nfl_schedule.update(nfl_schedule_params)
        format.html { redirect_to @nfl_schedule, notice: 'Nfl schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfl_schedule }
      else
        format.html { render :edit }
        format.json { render json: @nfl_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    schedules = FFNerd.schedule
    schedules.each do |record|
      game = NflSchedule.where(game_week: record.game_week, home_team: record.home_team, away_team: record.away_team).first_or_initialize
      incoming_fields = record.to_h.select { |k,v| game.respond_to? k }
      game.update(incoming_fields)
      game.save
    end
    redirect_to nfl_schedules_path
  end


  # DELETE /nfl_schedules/1
  # DELETE /nfl_schedules/1.json
  def destroy
    @nfl_schedule.destroy
    respond_to do |format|
      format.html { redirect_to nfl_schedules_url, notice: 'Nfl schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfl_schedule
      @nfl_schedule = NflSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfl_schedule_params
      params.require(:nfl_schedule).permit(:game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station)
    end
end

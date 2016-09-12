class NflTeamsController < ApplicationController
  before_action :set_nfl_team, only: [:show, :edit, :update, :destroy]

  # GET /nfl_teams
  # GET /nfl_teams.json
  def index
    @q = NflTeam.ransack(params[:q])
    @nfl_teams =  @q.result
  end

  # GET /nfl_teams/1
  # GET /nfl_teams/1.json
  def show
  end

  # GET /nfl_teams/new
  def new
    @nfl_team = NflTeam.new
  end

  # GET /nfl_teams/1/edit
  def edit
  end

  # POST /nfl_teams
  # POST /nfl_teams.json
  def create
    @nfl_team = NflTeam.new(nfl_team_params)

    respond_to do |format|
      if @nfl_team.save
        format.html { redirect_to @nfl_team, notice: 'Nfl team was successfully created.' }
        format.json { render :show, status: :created, location: @nfl_team }
      else
        format.html { render :new }
        format.json { render json: @nfl_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfl_teams/1
  # PATCH/PUT /nfl_teams/1.json
  def update
    respond_to do |format|
      if @nfl_team.update(nfl_team_params)
        format.html { redirect_to @nfl_team, notice: 'Nfl team was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfl_team }
      else
        format.html { render :edit }
        format.json { render json: @nfl_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nfl_teams/1
  # DELETE /nfl_teams/1.json
  def destroy
    @nfl_team.destroy
    respond_to do |format|
      format.html { redirect_to nfl_teams_url, notice: 'Nfl team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    teams = FFNerd.teams
    teams.each do |record|
      team = NflTeam.where(code: record.code).first_or_initialize
      incoming_fields = record.to_h.select { |k,v| team.respond_to? k }
      team.update(incoming_fields)
      team.save
    end
    redirect_to root_path, notice: "The import has run."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfl_team
      @nfl_team = NflTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfl_team_params
      params.require(:nfl_team).permit(:code, :full_name, :short_name)
    end
end

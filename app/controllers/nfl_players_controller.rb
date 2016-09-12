class NflPlayersController < ApplicationController
  before_action :set_nfl_player, only: [:show, :edit, :update, :destroy]

  # GET /nfl_players
  # GET /nfl_players.json
  def index
    @q = NflPlayer.ransack(params[:q])
    @nfl_players = @q.result.page params[:page]
  end

  # GET /nfl_players/1
  # GET /nfl_players/1.json
  def show
  end

  # GET /nfl_players/new
  def new
    @nfl_player = NflPlayer.new
  end

  # GET /nfl_players/1/edit
  def edit
  end

  # POST /nfl_players
  # POST /nfl_players.json
  def create
    @nfl_player = NflPlayer.new(nfl_player_params)

    respond_to do |format|
      if @nfl_player.save
        format.html { redirect_to @nfl_player, notice: 'Nfl player was successfully created.' }
        format.json { render :show, status: :created, location: @nfl_player }
      else
        format.html { render :new }
        format.json { render json: @nfl_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfl_players/1
  # PATCH/PUT /nfl_players/1.json
  def update
    respond_to do |format|
      if @nfl_player.update(nfl_player_params)
        format.html { redirect_to @nfl_player, notice: 'Nfl player was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfl_player }
      else
        format.html { render :edit }
        format.json { render json: @nfl_player.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    players = FFNerd.players
    players.each do |record|
      player = NflPlayer.where(ffn_id: record.player_id).first_or_initialize
      incoming_fields = record.to_h.select { |k,v| player.respond_to? k }
      player.update(incoming_fields)
      player.save
    end
    redirect_to nfl_players_path
  end

  # DELETE /nfl_players/1
  # DELETE /nfl_players/1.json
  def destroy
    @nfl_player.destroy
    respond_to do |format|
      format.html { redirect_to nfl_players_url, notice: 'Nfl player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfl_player
      @nfl_player = NflPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfl_player_params
      params.require(:nfl_player).permit(:ffn_id, :active, :jersey, :lname, :fname, :display_name, :team, :postition, :height, :weight, :dob, :college)
    end
end

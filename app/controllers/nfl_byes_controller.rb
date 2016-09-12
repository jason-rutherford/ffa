class NflByesController < ApplicationController
  before_action :set_nfl_bye, only: [:show, :edit, :update, :destroy]

  # GET /nfl_byes
  # GET /nfl_byes.json
  def index
    @nfl_byes = NflBye.all
  end

  # GET /nfl_byes/1
  # GET /nfl_byes/1.json
  def show
  end

  # GET /nfl_byes/new
  def new
    @nfl_bye = NflBye.new
  end

  # GET /nfl_byes/1/edit
  def edit
  end

  # POST /nfl_byes
  # POST /nfl_byes.json
  def create
    @nfl_bye = NflBye.new(nfl_bye_params)

    respond_to do |format|
      if @nfl_bye.save
        format.html { redirect_to @nfl_bye, notice: 'Nfl bye was successfully created.' }
        format.json { render :show, status: :created, location: @nfl_bye }
      else
        format.html { render :new }
        format.json { render json: @nfl_bye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfl_byes/1
  # PATCH/PUT /nfl_byes/1.json
  def update
    respond_to do |format|
      if @nfl_bye.update(nfl_bye_params)
        format.html { redirect_to @nfl_bye, notice: 'Nfl bye was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfl_bye }
      else
        format.html { render :edit }
        format.json { render json: @nfl_bye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nfl_byes/1
  # DELETE /nfl_byes/1.json
  def destroy
    @nfl_bye.destroy
    respond_to do |format|
      format.html { redirect_to nfl_byes_url, notice: 'Nfl bye was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    # nfl bye weeks are 4-11
    (4..11).each do |week|
      byes = FFNerd.byes(week)
      byes.each do |record|
        bye = NflBye.where(team: record.team, bye_week: record.bye_week).first_or_initialize
        incoming_fields = record.to_h.select { |k,v| bye.respond_to? k }
        bye.update(incoming_fields)
        bye.save
       puts week
      end
    end
    redirect_to nfl_byes_path, notice: "The import has run."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfl_bye
      @nfl_bye = NflBye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfl_bye_params
      params.require(:nfl_bye).permit(:team, :bye_week, :display_name)
    end
end

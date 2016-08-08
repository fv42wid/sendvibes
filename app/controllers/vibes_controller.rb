class VibesController < ApplicationController
  before_action :set_vibe, only: [:show, :edit, :update, :destroy]

  # GET /vibes
  # GET /vibes.json
  def index
    @vibes = Vibe.all
  end

  # GET /vibes/1
  # GET /vibes/1.json
  def show
  end

  # GET /vibes/new
  def new
    @vibe = Vibe.new
  end

  # GET /vibes/1/edit
  def edit
  end

  # POST /vibes
  # POST /vibes.json
  def create
    @vibe = Vibe.new(vibe_params)
    @vibe.user_id = current_user.id

    respond_to do |format|
      if @vibe.save
        format.html { redirect_to cause_path(@vibe.cause_id), notice: 'Vibe was successfully created.' }
        format.json { render :show, status: :created, location: @vibe }
      else
        format.html { render :new }
        format.json { render json: @vibe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vibes/1
  # PATCH/PUT /vibes/1.json
  def update
    respond_to do |format|
      if @vibe.update(vibe_params)
        format.html { redirect_to @vibe, notice: 'Vibe was successfully updated.' }
        format.json { render :show, status: :ok, location: @vibe }
      else
        format.html { render :edit }
        format.json { render json: @vibe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vibes/1
  # DELETE /vibes/1.json
  def destroy
    @vibe.destroy
    respond_to do |format|
      format.html { redirect_to vibes_url, notice: 'Vibe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vibe
      @vibe = Vibe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vibe_params
      params.require(:vibe).permit(:user_id, :cause_id)
    end
end

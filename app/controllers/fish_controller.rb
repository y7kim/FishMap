class FishController < ApplicationController
  before_action :authenticate, except: [:world]
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  # GET /fish
  # GET /fish.json
  def index
    @fish = current_user.fish.order("caught DESC")
    @hash = make_hash(@fish)
  end

  def world
    @fish = Fish.where("created_at > ?", 1.week.ago.to_date).where(isprivate: "f")
    @hash = make_hash(@fish)
  end

  # GET /fish/1
  # GET /fish/1.json
  def show

  end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish
  # POST /fish.json
  def create
    @fish = current_user.fish.new(fish_params)

    respond_to do |format|
      if @fish.save
        format.html { redirect_to fish_index_url, notice: 'Fish was successfully created.' }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish }
      else
        format.html { render :edit }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: 'Fish was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render "destroy", :locals => {:object => @fish}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fish_params
      params.require(:fish).permit(:species, :latitude, :longitude, :caught, :size, :attachment, :isprivate, :description)
    end
end

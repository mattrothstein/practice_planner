class DrillsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_drill, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit,:update,:destroy]

  # GET /drills
  # GET /drills.json
  def index
    @drills = Drill.all
  end

  # GET /drills/1
  # GET /drills/1.json
  def show
  end

  # GET /drills/new
  def new
    @drill = Drill.new
  end

  # GET /drills/1/edit
  def edit
  end

  # POST /drills
  # POST /drills.json
  def create
    @drill = Drill.new(drill_params)

    respond_to do |format|
      if @drill.save
        format.html { redirect_to @drill, notice: 'Drill was successfully created.' }
        format.json { render :show, status: :created, location: @drill }
      else
        format.html { render :new }
        format.json { render json: @drill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drills/1
  # PATCH/PUT /drills/1.json
  def update
    respond_to do |format|
      if @drill.update(drill_params)
        format.html { redirect_to @drill, notice: 'Drill was successfully updated.' }
        format.json { render :show, status: :ok, location: @drill }
      else
        format.html { render :edit }
        format.json { render json: @drill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drills/1
  # DELETE /drills/1.json
  def destroy
    @drill.destroy
    respond_to do |format|
      format.html { redirect_to drills_url, notice: 'Drill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drill
      @drill = Drill.find(params[:id])
    end
    
    def set_user
      @user = current_user
    end
    
    def authorize
      if @user != @drill.user
        redirect_to drills_path(), notice: "You are not authorized to make changes to this drill."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drill_params
      params.require(:drill).permit(:name, :notes, :sport, :user_id)
    end
end

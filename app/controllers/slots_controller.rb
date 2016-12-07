class SlotsController < ApplicationController
  before_action :set_practice
  before_action :set_slot, only: [:show, :edit, :update, :destroy]

  # GET /slots
  # GET /slots.json
  def index
    @slots = @practice.slots.all
  end

  # GET /slots/1
  # GET /slots/1.json
  def show
  end

  # GET /slots/new
  def new
    @slot = @practice.slots.new
  end

  # GET /slots/1/edit
  def edit
    respond_to do |format|
      format.js 
    end
  end

  # POST /slots
  # POST /slots.json
  def create
    @slot = @practice.slots.new(slot_params)

    respond_to do |format|
      if @slot.save
        format.html { redirect_to practice_slots_path(@practice), notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @slot }
      else
        format.html { render :new }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slots/1
  # PATCH/PUT /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to practice_path(@practice), notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to practice_path(@practice), notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end
    
    def set_practice
      @practice = Practice.find(params[:practice_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slot_params
      params.require(:slot).permit(:practice_id, :length, :drill_id)
    end
end

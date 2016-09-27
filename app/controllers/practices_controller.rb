class PracticesController < ApplicationController
  before_action :set_practice, only: [:show, :edit, :update, :destroy, :sort]
  before_action :authorize, only: [:edit,:update,:destroy]


  def sort
    params[:order].each do |key,value|
      @practice.slots.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  # GET /practices
  # GET /practices.json
  def index
    @practices = Practice.all
  end
  
  def my_practices
    @practices = current_user.practices  
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
    @slots = @practice.slots
  end

  # GET /practices/new
  def new
    @practice = Practice.new
  end

  # GET /practices/1/edit
  def edit
  end
  def copy_practice
    @copied_practice = Practice.find(params[:id])
    @practice = current_user.practices.new(@copied_practice.attributes)
  end
  
  def duplicate
    @practice = current_user.practices.new()
    @practice.team_id = params[:team_id]
    @practice.name = params[:name]
    @practice.length = params[:length]
    @practice.notes = params[:notes]
    @practice.date = DateTime.now
    
    @copied_practice = Practice.find(params[:copied_practice])
    @copied_practice.slots.each do |slot|
      slot_drill = Drill.find(slot.drill_id)
      new_drill = current_user.drills.new(slot_drill.attributes.except!("id"))
      new_drill.save
      new_drill_slot = @practice.slots.new(slot.attributes.except!("id"))
      new_drill_slot.drill_id = new_drill.id
      new_drill_slot.save
    end

    respond_to do |format|
      if @practice.save
        format.html { redirect_to my_practices_path, notice: 'Practice was successfully copied.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :back, notice: 'Unable to copy practice.' }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to @practice, notice: 'Practice was successfully created.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practices/1
  # PATCH/PUT /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url, notice: 'Practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end
    
    def authorize
      if current_user != @practice.user
        redirect_to practices_path(), notice: "You are not authorized to make changes to this practice."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_params
      params.require(:practice).permit(:team_id, :date, :name, :notes, :length, :user_id)
    end
end

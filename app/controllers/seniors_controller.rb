class SeniorsController < ApplicationController
  before_action :set_senior, only: %i[ show edit update destroy book_meet ]
  
  # GET /seniors or /seniors.json
  def index
    @query = Senior.ransack(affiliation_includes: nil)
    @seniors = @query.result(distinct: true)   
  end

  # GET /seniors/1 or /seniors/1.json
  def show
  end

  # GET /seniors/new
  def new
    @senior = Senior.new
  end

  # GET /seniors/1/edit
  def edit
  end

  # POST /seniors or /seniors.json
  def create
    @senior = Senior.new(senior_params)

    respond_to do |format|
      if @senior.save
        format.html { redirect_to senior_url(@senior), notice: "Senior was successfully created." }
        format.json { render :show, status: :created, location: @senior }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @senior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seniors/1 or /seniors/1.json
  def update
    respond_to do |format|
      if @senior.update(senior_params)
        format.html { redirect_to senior_url(@senior), notice: "Senior was successfully updated." }
        format.json { render :show, status: :ok, location: @senior }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @senior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seniors/1 or /seniors/1.json
  def destroy
    @senior.destroy

    respond_to do |format|
      format.html { redirect_to seniors_url, notice: "Senior was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @query = Senior.ransack(affiliation_includes: params[:query][:affiliation_includes])
    @seniors = @query.result(distinct: true)
    render :index
  end

  def book_meet
    meet = Meet.new(:senior_id => @senior.id, :user_id => current_user.id)
    meet.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_senior
      @senior = Senior.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def senior_params
      params.fetch(:senior, {})
    end
end

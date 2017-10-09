class DayScoresController < ApplicationController
  before_action :set_day_score, only: [:show, :edit, :update, :destroy]

  # GET /day_scores
  # GET /day_scores.json
  def index
    @day_scores = DayScore.all
  end

  # GET /day_scores/1
  # GET /day_scores/1.json
  def show
  end

  # GET /day_scores/new
  def new
    @day_score = DayScore.new
  end

  # GET /day_scores/1/edit
  def edit
  end

  # POST /day_scores
  # POST /day_scores.json
  def create
    @day_score = DayScore.new(day_score_params)

    respond_to do |format|
      if @day_score.save
        format.html { redirect_to @day_score, notice: 'Day score was successfully created.' }
        format.json { render :show, status: :created, location: @day_score }
      else
        format.html { render :new }
        format.json { render json: @day_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_scores/1
  # PATCH/PUT /day_scores/1.json
  def update
    respond_to do |format|
      if @day_score.update(day_score_params)
        format.html { redirect_to @day_score, notice: 'Day score was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_score }
      else
        format.html { render :edit }
        format.json { render json: @day_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_scores/1
  # DELETE /day_scores/1.json
  def destroy
    @day_score.destroy
    respond_to do |format|
      format.html { redirect_to day_scores_url, notice: 'Day score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_score
      @day_score = DayScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_score_params
      params.require(:day_score).permit(:day, :tension, :sleep)
    end
end

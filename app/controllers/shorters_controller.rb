class ShortersController < ApplicationController
  before_action :set_shorter, only: [:show, :edit, :update, :destroy]

  # GET /shorters
  # GET /shorters.json
  def index
    @shorters = Shorter.all
  end

  # GET /shorters/1
  # GET /shorters/1.json
  def show
    if @shorter
      redirect_to @shorter.long_url
    else
      flash[:errors] = "Cound not connect with any site please chech the url you are try to shorten"
      redirect_to root_path
    end
  end

  # GET /shorters/new
  def new
    @shorter = Shorter.new
  end

  # GET /shorters/1/edit
  def edit
  end

  # POST /shorters
  # POST /shorters.json
  def create
    @shorter = Shorter.new(shorter_params)

    respond_to do |format|
      if @shorter.save
        format.html { redirect_to root_url, notice: 'Shorter was successfully created.' }
        format.json { render :show, status: :created, location: @shorter }
      else
        format.html { render :new }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorters/1
  # PATCH/PUT /shorters/1.json
  def update
    respond_to do |format|
      if @shorter.update(shorter_params)
        format.html { redirect_to @shorter, notice: 'Shorter was successfully updated.' }
        format.json { render :show, status: :ok, location: @shorter }
      else
        format.html { render :edit }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorters/1
  # DELETE /shorters/1.json
  def destroy
    @shorter.destroy
    respond_to do |format|
      format.html { redirect_to shorters_url, notice: 'Shorter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorter
      @shorter = Shorter.find_by_short_url(params[:short_url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorter_params
      params.require(:shorter).permit(:long_url, :short_url, :click, :user_id)
    end
end

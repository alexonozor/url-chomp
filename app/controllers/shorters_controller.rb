class ShortersController < ApplicationController
  before_action :set_shorter, only: [:show, :edit, :update]
  before_action :find_by_id, only: [:details, :destroy, :edit]
  # GET /shorters
  # GET /shorters.json
  def index
    @shorter = Shorter.new
    @shorters = Shorter.all
  end

  # GET /shorters/1
  # GET /shorters/1.json
  def show
    if @shorter
      @shorter.click_counter if current_user
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
    @shorter.user_id = current_user.id if current_user
    respond_to do |format|
      if @shorter.save
        format.html { redirect_to root_url, notice: request.domain + @shorter.short_url }
        format.json { render :show, status: :created, location: @shorter }
        format.js
      else
        format.html { render :new }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
        format.js {'fail.js.erb'}
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
    @shorter = Shorter.find(params[:id])
    @shorter.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Shorter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def details
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorter
      @shorter = Shorter.find_by_short_url(params[:short_url])
    end

  def find_by_id
    @shorter = Shorter.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorter_params
      params.require(:shorter).permit(:long_url, :short_url, :clicks, :user_id)
    end
end

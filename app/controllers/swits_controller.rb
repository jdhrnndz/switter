class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  # GET /swits
  # GET /swits.json
  def index
    @swits = Swit.all
    @swit = Swit.new
    @name = User.find_by_id(session[:user_id]).username
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
  end

  # GET /swits/1
  # GET /swits/1.json
  def show
    @name = User.find_by_id(session[:user_id]).username
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
  end

  # GET /swits/new
  def new
    @swit = Swit.new
  end

  # GET /swits/1/edit
  def edit
    @name = User.find_by_id(session[:user_id]).username
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
    @swit = Swit.find(params[:id])
  end

  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)

    respond_to do |format|
      if @swit.save
        @swits = Swit.all  
        @swit = Swit.new
        format.html { render action: 'index'}
        format.json { render action: 'index', status: :created, location: @swit }
        @name = User.find_by_id(session[:user_id]).username
        @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
      else
        @swits = Swit.all
        @swit = Swit.new
        format.html { render action: 'index' }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    respond_to do |format|
      if @swit.update(swit_params)
        format.html { redirect_to @swit, notice: 'Swit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    @swit.destroy
    respond_to do |format|
      format.html { redirect_to swits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:text, :poster)
    end
end

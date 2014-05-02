class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @name = User.find_by_id(session[:user_id]).username
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
  end

  # GET /users/new
  def new
    if current_user
      @swits = Swit.all
      redirect_to swits_path(@swits)
    else
      @user = User.new
      @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
    end
  end

  # GET /users/1/edit
  def edit
    @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
    @name = User.find_by_id(session[:user_id]).username
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for Switter"
      @name = User.find_by_id(session[:user_id]).username
      @recent = Swit.find_by_sql("Select text from swits where text like '%{%}%' order by created_at desc limit 100")
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to swits_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end

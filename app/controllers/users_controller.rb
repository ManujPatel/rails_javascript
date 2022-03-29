class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy profile update_profile ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def profile
  
  end
  
  def update_profile
    if @user.update(user_params)
      respond_to do |format|
        format.js
        flash.now[:alert]=["Successfully Updated"]
      end
    else 
      flash.now[:alert] = @user.errors.full_messages
      respond_to do |format|
        format.js
      end
    end
  end

  def change_password
    
  end

  def update_password
    if(@user.password==params[:password])
      @user.update_attribute(:password,params[:new_password])
      redirect_to new_users_path
    else 
      flash.now[:alert]=["Incorrect old password"]
      puts flash[:alert]
      render "change_password"
    end
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :subscription, :subscription_email)
    end
end

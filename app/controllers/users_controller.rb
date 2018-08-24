class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]

	def index
    @users = User.all.order("created_at DESC")
    @user = User.new
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @users = User.all
  end

  # GET /orders/new
  def new
  	  @user = User.new
  end

  # GET /orders/1/edit
  def edit
  end

	def create
    @user = User.new
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
def update
 respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to full_orders_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	private
	def set_user
      @user = User.find(params[:id])
    end
	def user_params 
		params.require(:user).permit(:name, :username, :company_name, :favorite_order, :email, :password, :password_confirmation, :current_password)
	end
end

class RejectedordersController < ApplicationController
  before_action :set_rejectedorder, only: [:show, :edit, :update, :destroy]

  # GET /rejectedorders
  # GET /rejectedorders.json
  def index
    @rejectedorders = Rejectedorder.all
  end

  # GET /rejectedorders/1
  # GET /rejectedorders/1.json
  def show
  end

  # GET /rejectedorders/new
  def new
    @rejectedorder = Rejectedorder.new
  end

  # GET /rejectedorders/1/edit
  def edit
  end

  # POST /rejectedorders
  # POST /rejectedorders.json
  def create
  @orders = Order.all
    if @orders.blank?
    else
    @rejectedorder = Rejectedorder.new(rejectedorder_params)
    @rejectedorder.rejected_order=""
    @orders.each do |order| 
    if order.drink == "Coffee"
    @rejectedorder.rejected_order << "[ "
    @rejectedorder.rejected_order<< order.drink
    @rejectedorder.rejected_order << ":"
    @rejectedorder.rejected_order << order.coffee_type
    @rejectedorder.rejected_order << " ("
    @rejectedorder.rejected_order << order.milk_amount.to_s
    @rejectedorder.rejected_order << " milk) ("
    @rejectedorder.rejected_order << order.sugar_amount.to_s
    @rejectedorder.rejected_order << " sugar) "
    @rejectedorder.rejected_order << " ] "
    @orders.each(&:destroy)
  elsif order.drink == "Tea"
     @rejectedorder.rejected_order << "[ "
     @rejectedorder.rejected_order << order.drink
     @rejectedorder.rejected_order << " ("
     @rejectedorder.rejected_order << order.milk_amount.to_s
     @rejectedorder.rejected_order << " milk) ("
     @rejectedorder.rejected_order << order.sugar_amount.to_s
     @rejectedorder.rejected_order << " sugar) "
     @rejectedorder.rejected_order << " ] "
     @orders.each(&:destroy)
  else
    @rejectedorder.rejected_order << "[ "
    @rejectedorder.rejected_orderr << order.drink
    @rejectedorder.rejected_order << " ] "
    @orders.each(&:destroy)
   end
 end
    respond_to do |format|
      if @rejectedorder.save
        format.html { redirect_to root_path, notice: 'Rejectedorder was successfully created.' }
        format.json { render :show, status: :created, location: @rejectedorder }
      else
        format.html { render :new }
        format.json { render json: @rejectedorder.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # PATCH/PUT /rejectedorders/1
  # PATCH/PUT /rejectedorders/1.json
  def update
    respond_to do |format|
      if @rejectedorder.update(rejectedorder_params)
        format.html { redirect_to @rejectedorder, notice: 'Rejectedorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @rejectedorder }
      else
        format.html { render :edit }
        format.json { render json: @rejectedorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rejectedorders/1
  # DELETE /rejectedorders/1.json
  def destroy
    @rejectedorder.destroy
    respond_to do |format|
      format.html { redirect_to rejectedorders_url, notice: 'Rejectedorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rejectedorder
      @rejectedorder = Rejectedorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rejectedorder_params
      params.require(:rejectedorder).permit(:rejected_order, :comment)
    end
end

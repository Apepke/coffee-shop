class FullOrdersController < ApplicationController
  before_action :set_full_order, only: [:show, :edit, :update, :destroy]

  # GET /full_orders
  # GET /full_orders.json
  def index
    @full_orders = FullOrder.where(["order_company_name ILIKE ?", "%#{params[:search]}%"])
  end
  # GET /full_orders/1
  # GET /full_orders/1.json
  def 
    show
  end
  # GET /full_orders/new
  def new
    @full_order = FullOrder.new
  end

  # GET /full_orders/1/edit
  def edit
  end

  # POST /full_orders
  # POST /full_orders.json
  def create
    @orders = Order.all
    @user=current_user
    if @orders.blank?
    else
    @full_order = FullOrder.new(full_order_params)
    @full_order.order_status = "In Progress"
    @full_order.order_company_name = @user.company_name
    @orders.each do |order| 
    if order.drink == "Coffee"
    @full_order.fullorder << "[ "
    @full_order.fullorder << order.drink
    @full_order.fullorder << ":"
    @full_order.fullorder << order.coffee_type
    @full_order.fullorder << " ("
    @full_order.fullorder << order.milk_amount.to_s
    @full_order.fullorder << " milk) ("
    @full_order.fullorder << order.sugar_amount.to_s
    @full_order.fullorder << " sugar) "
    @full_order.fullorder << " ] "
    @orders.each(&:destroy)
  elsif order.drink == "Tea"
    @full_order.fullorder << "[ "
    @full_order.fullorder << order.drink
    @full_order.fullorder << " ("
    @full_order.fullorder << order.milk_amount.to_s
    @full_order.fullorder << " milk) ("
    @full_order.fullorder << order.sugar_amount.to_s
    @full_order.fullorder << " sugar) "
    @full_order.fullorder << " ] "
    @orders.each(&:destroy)
  else
    @full_order.fullorder << "[ "
    @full_order.fullorder << order.drink
    @full_order.fullorder << " ] "
    @orders.each(&:destroy)
   end
 end
    respond_to do |format|
      if @full_order.save
        format.html { redirect_to full_orders_path, notice: 'Full order was successfully created.' }
        format.json { render :show, status: :created, location: @full_order }
      else
        format.html { render :new }
        format.json { render json: @full_order.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /full_orders/1
  # PATCH/PUT /full_orders/1.json
  def update
    respond_to do |format|
      if @full_order.update(full_order_params)
        format.html { redirect_to full_orders_path, notice: 'Full order was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_order }
      else
        format.html { render :edit }
        format.json { render json: @full_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_orders/1
  # DELETE /full_orders/1.json
  def destroy
    @full_order.destroy
    respond_to do |format|
      format.html { redirect_to full_orders_path, notice: 'Full order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_order
      @full_order = FullOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_order_params
      params.require(:full_order).permit(:fullorder, :order_status , :order_company_name )
   end
end


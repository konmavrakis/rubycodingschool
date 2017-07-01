class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  include SkroutzApi

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.search(params[:keyword],  page: params[:page], pages: 10 , user_id: current_user.id )
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @products = @list.product_lists 
    @sku_list = @products.map do | p | 
      sku = SkroutzApi.find_sku(p.sku_id)
      {sku: sku, quantity: p.quantity}
    end
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(name: list_params["name"], active: list_params["active"], user_id: current_user.id)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_product
    id_to_delete = params[:sku_id]
    active_list = List.find(params[:list_id])
    
    if List.find(params[:list_id]).user_id == current_user.id
      active_list.products.delete(active_list.products.find_by(skroutz_id: id_to_delete).id)
      redirect_to( list_path(id: active_list), notice: 'Product deleted')  
    else
      redirect_to( list_path(id: active_list), alert: 'You don\'t have access to delete this product')  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :active, :total_price, :sku_id)
    end
end

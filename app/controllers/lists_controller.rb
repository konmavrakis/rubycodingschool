class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  include SkroutzApi

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.where(user_id: current_user.id)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @products_list = List.find(@list.id).product_lists
    @sku = @products_list.map do |p|
      {
        sku: SkroutzApi.find_sku(Product.find(p.product_id).skroutz_id),
        product_list: p
      }
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

  def RemoveProduct
    id_to_delete = params[:sku_id]
    #list = params[:list]
    active_list = List.find(params[:list_id])
    debugger
    active_list.products.delete(active_list.products.find_by(skroutz_id: id_to_delete).id)
    redirect_to action: "show", id: active_list,  flash: {notice: "Product successfully removed"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :active, :total_price)
    end
end

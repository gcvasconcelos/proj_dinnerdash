class ItemsController < ApplicationController
  
  def index
    @items = Item.search(params[:search])
    #@items = Item.all
    #@order_item = current_order.order_items.new
  end

  def new
    @item = Item.new
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  		redirect_to @item
  	else
  		render 'new'
  	end
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
 
  	if @item.update(item_params)
    	redirect_to @item
  	else
    	render 'edit'
  	end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
 
    redirect_to items_path
  end
  def delete
    @item = Item.find(params[:id])
    @item.destroy
  end

  private
  	def item_params
  		params.require(:item).permit(:name, :description, :price)
  	end

end
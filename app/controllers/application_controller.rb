class ApplicationController < ActionController::Base
  
  def index
  	@categories = Category.all
  end
  	
  def show
  	@category = Category.find(params[:id])
  end

  def new
  end

  def edit
    @category = Category.find(params[:id])
  end
 
  def create
    @category = Category.new(category_params)
 
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end
 
  def update
    @category = Category.find(params[:id])
 
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
 
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    redirect_to categorys_path
  end

  private
  	def catergory_params
  		params.require(:category).permit(:validates, :presence)
  	end
end

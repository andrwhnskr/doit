class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new  
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :description))

    if @list.save
      redirect_to @list, notice: "List was created!"
    else
      render :new
    end
    
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(params.require(:list).permit(:title, :description))
      redirect_to @list, notice: "List was updated!"
    else
      flash[:error] = "Error saving list. Please try again"
      render :edit
    end
  end
end

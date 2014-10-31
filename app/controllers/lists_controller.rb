class ListsController < ApplicationController
  
  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(params.require(:list).permit(:title, :description))

    if @list.save
      redirect_to lists_path, notice: "List was created!"
    else
      render :new
    end
    
  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])

    if @list.update_attributes(params.require(:list).permit(:title, :description))
      redirect_to @list, notice: "List was updated!"
    else
      flash[:error] = "Error saving list. Please try again"
      render :edit
    end
  end


end

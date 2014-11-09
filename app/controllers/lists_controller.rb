class ListsController < ApplicationController
  before_action :set_list, only: [:update, :destroy, :show]

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      redirect_to lists_path, notice: "List was created!"
    else
      render :new
    end
    
  end

  def show
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to @list, notice: "List was updated!"
    else
      flash[:error] = "Error saving list. Please try again"
      render :edit
    end
  end

  def destroy
    if @list.destroy
      flash[:success] = "List was deleted"
    else
      flash[:error] = "List could not be deleted"
    end
    redirect_to lists_path
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description)
  end


end

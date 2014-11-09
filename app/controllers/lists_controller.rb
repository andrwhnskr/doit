class ListsController < ApplicationController
  before_action :set_list, except: [:index, :new, :create]

  def index
    @lists = current_user.lists.not_done
    @completed = current_user.lists.done
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
      redirect_to @list, notice: "Item was updated!"
    else
      flash[:error] = "Error saving list. Please try again"
      render :edit
    end
  end

  def destroy
    if @list.destroy
      flash[:success] = "Item was deleted"
    else
      flash[:error] = "Item could not be deleted"
    end
    redirect_to lists_path
  end

  def complete
    @list.update_attribute(:completed, true)
    redirect_to lists_path, notice: "Item was completed"
  end

  def redo
    @list.update_attribute(:completed, false)
    redirect_to lists_path, notice: "Item was marked incomplete"
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description)
  end




end

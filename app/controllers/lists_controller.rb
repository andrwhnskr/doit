class ListsController < ApplicationController
  def new
  end
  def create
    @list = List.new(params.require(:list).permit(:title, :description))
    @list.save
    redirect_to @list, notice: "List was created!"
  end
  def show
    @list = List.find(params[:id])
  end
end

class Api::ListsController < ApplicationController

  def index
    lists = List.order('created_at DESC')
    render json: lists
  end

  def create
    list = List.new(list_params)
    if list.save
      lists = List.all
      render json: lists, status: :created
    else
      render :index
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      head :no_content
    else
      render :index
    end
  end

  private

  def list_params
    params.require(:list).permit(:content, :detail, :period)
  end

end

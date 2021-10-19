class Api::ListsController < ApplicationController

  def index
    lists = List.order('created_at DESC')
    render json: lists
  end


end

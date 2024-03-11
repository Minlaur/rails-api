class Api::V1::CafesController < ApplicationController

def index
  @cafes = Cafe.all
  if params[:title].present?
    @cafes = @cafes.where('title ILIKE ?', "%#{params[:title]}%")
  else
    @cafes = Cafe.all
    render json: @cafes.order(created_at: :desc)
  end
end
